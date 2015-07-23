require "featurecorder/version"
require "featurecorder/dictionary"
require "featurecorder/translate"
require "nokogiri"
require "ascii"

module Featurecorder

  def self.run()
    file = File.open(ARGV[0])
    doc = Nokogiri::XML(file)
    steps = doc.xpath('//selenese').map do |doc|
      { command: doc.xpath('command').first.content,
        target: doc.xpath('target').first.content,
        value: doc.xpath('value').first.content }
    end
    file.close

    puts 'Name your Feature:'
    feature_name = STDIN.gets
    puts 'Name your Scenario:'
    scenario_name = STDIN.gets

    clean_value(steps)
    feature = create_feature(steps)

    File.open("#{feature_name.split(' ').each { |word| word.capitalize! }.
      join('')}.feature", 'w') do |file|
      file.write("Feature: #{feature_name}\nScenario: #{scenario_name}" +
        feature.uniq.join("\n"))
      file.close
    end

    File.open("#{Ascii.process(feature_name).
      gsub!(/\s+/, '_').downcase}_steps.rb", 'w') do |file|
      file.write(create_steps(feature, steps).join("\n"))
      file.close
    end
  end
end