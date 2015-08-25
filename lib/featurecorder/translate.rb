  def create_feature(steps)
    feature = steps.map do |step|
      COMMANDS[step[:command].to_sym][:sentence].
      (target(step[:target]), step[:value])
    end
  end

  def create_steps(feature, steps)
    commands = []
    steps.each do |step|
      commands.push(COMMANDS[step[:command].to_sym][:command].
      (target(step[:target]), step[:value]))
    end
    cucumber = []
    feature.each do |step|
      str = step.split(' ', 2)
      cucumber.push("#{str.first}(/^#{str.last.gsub(/([?+*{}])/,
       '\\\\\1')}$/) do\n\t#{commands.shift}\nend\n")
    end
    cucumber.chunk{|x| x}.map(&:first)
  end

  def clean_value(steps)
    steps.map do |step|
      step[:value] = step[:value][/(?:.*(?:exact:|glob:|regexp:))?(.*)/,1]
      step[:target] = step[:target][/(?:.*(?:exact:|glob:|regexp:))?(.*)/,1]
    end
  end
