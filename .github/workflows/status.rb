puts "hello from inside #{ENV["ALEX_VAR"]} #{ENV["ALEX_VAR"].to_s.length}"
puts `git remote show origin`
puts `git checkout -b new-branch`
puts `git push -u origin new-branch`
