class Bicycle include Schedulable
  attr_reader :schedule, :size, :chain, :tire_size

  def initialize(**opts)
    @size      = opts[:size]
    @chain     = opts[:chain]     || default_chain
    @tire_size = opts[:tire_size] || default_tire_size
    @schedule  = opts[:schedule]  || Schedule.new

    post_initialize(opts)
  end

  def post_initialize
  end

  def lead_days
    1
  end

  def spares
    {
      tire_size: tire_size
      chain:     chain
    }.merge(local_spares)
  end

  def local_spares
    {}
  end

  def default_chain
    '11-speed'
  end

  def default_tire_size
    raise NotImplementedError,
          "#{self.class} should have implemented tire_size"
  end
end
