COMMANDS =
  { open: {
      command: lambda { |target, value| "visit '#{target}'" },
      sentence: lambda { |target, value| "When I visit '#{target.gsub('/','\\\\/')}'" }
      },
    click: {
      command: lambda { |target, value| "click_on('#{target}')" },
      sentence: lambda { |target, value| "When I click on '#{target}'" }
      },
    clickAndWait: {
      command: lambda { |target, value| "click_on('#{target}')" },
      sentence: lambda { |target, value| "When I click on '#{target}'" }
      },
    type: {
      command: lambda { |target, value| "fill_in('#{target}', :with => '#{value}')" },
      sentence: lambda { |target, value| "When I fill in '#{target}' with '#{value}'" }
      },
    verifyTitle: {
      command: lambda { |target, value| "page.should have_content('#{target}')" },
      sentence: lambda { |target, value| "Then I should see the title '#{target}'" }
      },
    assertTitle: {
      command: lambda { |target, value| "page.should have_content('#{target}')" },
      sentence: lambda { |target, value| "Then I should see the title '#{target}'" }
      },
    verifyElementPresent: {
      command: lambda { |target, value| "page.should have_css('#{target}')" },
      sentence: lambda { |target, value| "Then I should see '#{target}'" }
      },
    verifyText: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the text '#{value}'" }
      },
    assertText: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the text '#{value}'" }
      },
    unsupported: {
      command: "#This command is not yet supported by featurecorder",
      sentence: lambda { |command, target, value| "When I run the command '#{command}' with target '#{target}' and value '#{value}'" }
    }
  }

BEGIN {
  def target(target)
    if target.include? "="
      target[/=\W*([^']+)/][$1]
    else
      target
    end
  end
}