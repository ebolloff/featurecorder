require "featurecorder/version"
require "featurecorder/dictionary"
require "featurecorder/translate"
require "nokogiri"
require "ascii"
require 'docopt'

module Featurecorder

  def self.run(scenario_name, feature_name, file_name, output_dir)
    file = File.open(file_name)
    doc = Nokogiri::XML(file)
    steps = doc.xpath('//selenese').map do |doc|
      { command: doc.xpath('command').first.content,
        target: doc.xpath('target').first.content,
        value: doc.xpath('value').first.content }
    end
    file.close

    unless feature_name
      print 'Name your Feature: '
      feature_name = STDIN.gets
    end

    feature_name = feature_name.gsub("\n", "")

    unless scenario_name
      print 'Name your Scenario: '
      scenario_name = STDIN.gets
    end

    scenario_name = scenario_name.gsub("\n", "")

    clean_value(steps)
    feature = create_feature(steps)

    begin
      File.open("#{output_dir}/#{Ascii.process(feature_name.split(' ').
        each { |word| word.capitalize! }.join(''))}.feature", 'w') do |file|
        file.write("Feature: #{feature_name}\n\nScenario: #{scenario_name}\n\n" +
          feature.uniq.join("\n"))
        file.close
      end
      File.open("#{output_dir}/#{Ascii.process(feature_name).
        gsub!(/\s+/, '_').downcase}_steps.rb", 'w') do |file|
        file.write(create_steps(feature, steps).join("\n"))
        file.close
      end
    rescue Errno::ENOENT => e
      puts "Could not write file to #{output_dir}"
    end
  end

end