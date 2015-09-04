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
      }, #waitForPageToLoad
    verifyTitle: {
      command: lambda { |target, value| "page.should have_content('#{target}')" },
      sentence: lambda { |target, value| "Then I should see the title '#{target}'" }
      },
    assertTitle: {
      command: lambda { |target, value| "page.should have_content('#{target}')" },
      sentence: lambda { |target, value| "Then I should see the title '#{target}'" }
      },
    verifyTextPresent: {
      command: lambda { |target, value| "page.should have_content('#{value}')" },
      sentence: lambda { |target, value| "Then I should see the text '#{value}'" }
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
    type: {
      command: lambda { |target, value| "fill_in('#{target}', :with => '#{value}')" },
      sentence: lambda { |target, value| "When I fill in '#{target}' with '#{value}'" }
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