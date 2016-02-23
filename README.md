
# Boris Bikes challenge repo
author: Arnold Manzano (arnoldmanzano) and various pair partners in Makers Jan16 cohort

Instructions:
1. Fork or clone the repo
2. run `bundle` to install dependencies (ruby/rvm is required)
3. run `rspec` to run tests
4. run in `irb` or `pry`

Example commands in `irb`, `pry`, or `.rb` file
```sh
1] pry(main)> require './lib/docking_station.rb'
=> true
[2] pry(main)> station = DockingStation.new
=> #<DockingStation:0x007ffa29036878 @bikes=[], @capacity=20>
[3] pry(main)> bike1 = Bike.new
=> #<Bike:0x007ffa29d8e868 @working=true>
[4] pry(main)> bike2 = Bike.new
=> #<Bike:0x007ffa29d14108 @working=true>
[5] pry(main)> van = Van.new
=> #<Van:0x007ffa29c755f8 @bikes=[]>
[6] pry(main)> garage = Garage.new
=> #<Garage:0x007ffa29bee8f0 @bikes=[]>
[7] pry(main)> station.dock(bike1)
=> [#<Bike:0x007ffa29d8e868 @working=true>]
[8] pry(main)> station.dock(bike2, broken: true)
=> [#<Bike:0x007ffa29d8e868 @working=true>, #<Bike:0x007ffa29d14108 @working=false>]
[9] pry(main)> van.collect_from(station)
=> [#<Bike:0x007ffa29d14108 @working=false>]
[10] pry(main)> van.deliver_to(garage)
=> [#<Bike:0x007ffa29d14108 @working=true>]
[11] pry(main)> van.collect_from(garage)
=> [#<Bike:0x007ffa29d14108 @working=true>]
[12] pry(main)> van.deliver_to(station)
=> [#<Bike:0x007ffa29d8e868 @working=true>, #<Bike:0x007ffa29d14108 @working=true>]
[13] pry(main)> station.release_bike
=> #<Bike:0x007ffa29d8e868 @working=true>
[14] pry(main)> station.release_bike
=> #<Bike:0x007ffa29d14108 @working=true>
[15] pry(main)> station.release_bike
RuntimeError: No bikes
```

User Stories:
```
As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

As a member of the public,
So that I reduce the chance of getting a broken bike in future,
I'd like to report a bike as broken when I return it.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations not to release broken bikes.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like docking stations to accept returning bikes (broken or not).

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to take broken bikes from docking stations and deliver them to garages to be fixed.

As a maintainer of the system,
So that I can manage broken bikes and not disappoint users,
I'd like vans to collect working bikes from garages and distribute them to docking stations.
```
