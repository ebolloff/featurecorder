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

    if doc.root.nil?
      abort "Not a valid XML document"
    elsif !doc.root.name.eql?('TestCase')
      abort "Not a valid Selenium XML Test"
    elsif !doc.xpath('//selenese').any?
      abort "Empty Selenium XML Test"
    end

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
      feature_file_name = "#{Ascii.process(feature_name.split(' ').
        each { |word| word.capitalize! }.join(''))}.feature"
      File.open("#{output_dir}/#{feature_file_name}", 'w') do |file|
        file.write("@recorded\nFeature: #{feature_name}\n\nScenario: #{scenario_name}\n" +
          feature.chunk{|x| x}.map(&:first).join("\n"))
        file.close
      end
      puts "Successfully created #{feature_file_name}"
      steps_file_name = "#{Ascii.process(feature_name).
        gsub(/\s+/, '_').downcase}_steps.rb"
      File.open("#{output_dir}/#{steps_file_name}", 'w') do |file|
        file.write(create_steps(feature, steps).join("\n"))
        file.close
      end
      puts "Successfully created #{steps_file_name}"
    rescue Errno::ENOENT => e
      abort "Could not find #{output_dir}"
    rescue Errno::EACCES => e
      abort "Permission denied on #{output_dir}"
    end
  end

end