module Medic
  module Finders

    def observe(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::ObserverQuery.new query_params do |query, completion, error|
        block.call(completion, error)
      end
      Medic.execute(query)
    end

    def find_sources(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::SourceQuery.new query_params do |query, results, error|
        sources = results ? results.allObjects.map{ |source| source.name.to_s } : []
        block.call(sources)
      end
      Medic.execute(query)
    end

    def find_samples(type, options={}, block=Proc.new)
      query_params = options.merge(type: type)
      query = Medic::SampleQuery.new query_params do |query, results, error|
        block.call(samples_to_hashes(Array(results)))
      end
      Medic.execute(query)
    end

  private

    def samples_to_hashes(samples)
      samples.map do |sample|
        h = {}
        h[:uuid] = sample.UUID.UUIDString
        h[:metadata] = sample.metadata
        h[:source] = sample.source.name
        h[:start_date] = sample.startDate
        h[:end_date] = sample.endDate
        h[:sample_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.sampleType.identifier)

        if sample.respond_to?(:categoryType) && sample.respond_to?(:value)
          h[:category_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.categoryType.identifier)
          h[:value] = [:in_bed, :asleep][sample.value] # SleepAnalysis is the only category type at the moment
        end

        if sample.respond_to?(:correlationType) && sample.respond_to?(:objects)
          h[:correlation_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.correlationType.identifier)
          h[:objects] = samples_to_hashes(Array(sample.objects.allObjects))
        end

        if sample.respond_to?(:quantity) && sample.respond_to?(:quantityType)
          h[:quantity] = sample.quantity.doubleValueForUnit(sample.quantityType.canonicalUnit)
          h[:quantity_type] = Medic::Types::TYPE_IDENTIFIERS.index(sample.quantityType.identifier)
          h[:canonical_unit] = sample.quantityType.canonicalUnit.unitString
        end

        h[:duration] = sample.duration if sample.respond_to?(:duration)
        h[:total_distance] = sample.totalDistance if sample.respond_to?(:totalDistance)
        h[:total_energy_burned] = sample.totalEnergyBurned if sample.respond_to?(:totalEnergyBurned)
        h[:workout_activity_type] = sample.workoutActivityType if sample.respond_to?(:workoutActivityType)
        h[:workout_events] = sample.workoutEvents  if sample.respond_to?(:workoutEvents)
        h
      end
    end

  end
end
