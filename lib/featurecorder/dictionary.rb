COMMANDS =
  { open: {
      command: lambda { |target, value| "visit #{target}" },
      sentence: lambda { |target, value| "When I visit #{target}" }
      },
    click: {
      command: lambda { |target, value| "click_on('#{target}')" },
      sentence: lambda { |target, value| "When I click on '#{target}'" }
      },
    clickAndWait: {
      command: lambda { |target, value| "click_on('#{target}')" },
      sentence: lambda { |target, value| "When I click on '#{target}'" }
      }, #waitForPageToLoad
    verifyTitle: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the title '#{value}'" }
      },
    assertTitle: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the title '#{value}'" }
      },
    verifyTextPresent: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the text '#{value}'" }
      },
    verifyElementPresent: {
      command: lambda { |target, value| 'page.should have_css' },
      sentence: lambda { |target, value| "Then I should see '#{value}'" }
      },
    verifyText: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the text '#{value}'" }
      },
    assertText: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the text '#{value}'" }
      },
    type: {
      command: lambda { |target, value| "fill_in('#{target}', :with => '#{value}')" },
      sentence: lambda { |target, value| "When I fill in '#{target}' with '#{value}'" }
      },
    #verifyTable: { command: , sentence: },
    #WaitForElementPresent: {command: , sentence: }
  }

TARGETS =
  {
    '/' => 'root_path'
  }

BEGIN {
  def target(target)
    if TARGETS[target].nil?
      target[/=\W*([^']+)/][$1]
    else
      TARGETS[target]
    end
  end
}