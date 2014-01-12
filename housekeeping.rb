# Analyze the subdirectories of your 'projects' directory for unhealthy folders.
# Usage: cd ~/projects && ruby git-housekeeping.rb

Dir["*/"].each do |project_dir|
  unless File.exists?(project_dir+".git")
    status = "Not a Git repo"
  else
    Dir.chdir project_dir
    unless system("git show-ref --head --quiet")
      status = "Never committed"
    else
      if `git remote`==""
        status = "No remote"
      else
        unless system("git diff --quiet")
          status = "Unstaged changes"
        else
          unless system("git diff --cached --quiet")
            status = "Uncommitted changes"
          else
            unless `git log --branches --not --remotes --oneline`.scan("\n").count == 0
              status = "Unpushed changes"
            else
              status = "OK"
            end
          end
        end
      end
    end
    Dir.chdir ".."
  end


  puts "%40s - %20s" % [project_dir, status]
end