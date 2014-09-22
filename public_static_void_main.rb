#! /usr/bin/env ruby

require 'bundler'
Bundler.require
Dotenv.load

AWS.config(:dynamo_db => { :api_version => '2012-08-10' })
ddb = AWS::DynamoDB.new
tables = ddb.tables.inject({}) { |memo, table| memo[table.name.intern] = table.load_schema; memo }

binding.pry

__END__

tables[:ProductCatalog].items.create(
  Id: "101",
  Title: "Book 101 Title",
  ISBN: "111-1111111111",
  Authors: ["Author1"],
  Price: "2",
  Dimensions: "8.5 x 11.0 x 0.5",
  PageCount: "500",
  InPublication: "1",
  ProductCategory: "Book"
)

tables[:ProductCatalog].items.create(
  Id: "102",
  Title: "Book 102 Title",
  ISBN: "222-2222222222",
  Authors: ["Author1", "Author2"],
  Price: "20",
  Dimensions: "8.5 x 11.0 x 0.8",
  PageCount: "600",
  InPublication: "1",
  ProductCategory: "Book",
)
tables[:ProductCatalog].items.create(
  Id: "103",
  Title: "Book 103 Title",
  ISBN: "333-3333333333",
  Authors: ["Author1", "Author2"],
  Price: "2000",
  Dimensions: "8.5 x 11.0 x 1.5",
  PageCount: "600",
  InPublication: "0",
  ProductCategory: "Book",
)
tables[:ProductCatalog].items.create(
  Id: "201",
  Title: "18-Bike-201",
  Description: "201 Description",
  BicycleType: "Road",
  Brand: "Mountain A",
  Price: "100",
  Gender: "M",
  Color: ["Red", "Black"],
  ProductCategory: "Bicycle",
)
tables[:ProductCatalog].items.create(
  Id: "202",
  Title: "21-Bike-202",
  Description: "202 Description",
  BicycleType: "Road",
  Brand: "Brand-Company A",
  Price: "200",
  Gender: "M",
  Color: ["Green", "Black"],
  ProductCategory: "Bicycle",
)
tables[:ProductCatalog].items.create(
  Id: "203",
  Title: "19-Bike-203",
  Description: "203 Description",
  BicycleType: "Road",
  Brand: "Brand-Company B",
  Price: "300",
  Gender: "W",
  Color: ["Red", "Green", "Black"],
  ProductCategory: "Bicycle",
)
tables[:ProductCatalog].items.create(
  Id: "204",
  Title: "18-Bike-204",
  Description: "204 Description",
  BicycleType: "Mountain",
  Brand: "Brand-Company B",
  Price: "400",
  Gender: "W",
  Color: ["Red"],
  ProductCategory: "Bicycle",
)
tables[:ProductCatalog].items.create(
  Id: "205",
  Title: "20-Bike-205",
  Description: "205 Description",
  BicycleType: "Hybrid",
  Brand: "Brand-Company C",
  Price: "500",
  Gender: "B",
  Color: ["Red", "Black"],
  ProductCategory: "Bicycle",
)

tables[:Forum].items.create(
  Name: "Amazon DynamoDB",
  Category: "Amazon Web Services",
  Threads: "2",
  Messages: "4",
  Views: "1000",
)

tables[:Forum].items.create(
  Name: "Amazon S3",
  Category: "Amazon Web Services",
  Threads: "0",
)
