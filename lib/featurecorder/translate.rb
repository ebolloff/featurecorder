  def create_feature(steps)
    feature = steps.map do |step|
      if COMMANDS[step[:command].to_sym].nil?
        COMMANDS[:unsupported][:sentence].
        (step[:command], target(step[:target]), step[:value]).gsub('\/','/')
      else
        COMMANDS[step[:command].to_sym][:sentence].
        (target(step[:target]), step[:value]).gsub('\/','/')
      end
    end
  end

  def create_steps(feature, steps)
    commands = []
    steps.each do |step|
      if COMMANDS[step[:command].to_sym].nil?
        commands.push(COMMANDS[:unsupported][:command])
      else
        commands.push(COMMANDS[step[:command].to_sym][:command].
        (target(step[:target]), step[:value]))
      end
    end
    step_def = []
    feature.each do |step|
      str = step.split(' ', 2)
      step_def.push("#{str.first}(/^#{str.last.gsub(/([?+\/*{}])/,
       '\\\\\1')}$/) do\n\t#{commands.shift}\nend\n")
    end
    step_def.chunk{|x| x}.map(&:first)
  end

  def clean_value(steps)
    selenium_regex = /(?:.*(?:exact:|glob:|regexp:))?(.*)/
    steps.map do |step|
      step[:value] = step[:value][selenium_regex,1]
      step[:target] = step[:target][selenium_regex,1]
    end
  end
