# Setup basic Shiny App on Posit Cloud
# Gabriel Odom
# 2025-09-16

usethis::use_git()
usethis::use_github()
# following work in: https://github.com/hadley/madlibs4

# after committing the basic app, run
rsconnect::writeManifest()

# So after I tried to connect with Posit Cloud, I got an error:
# 2025-09-16T11:57:10-04:00 Error in check_no_origin() :
# 2025-09-16T11:57:10-04:00   ✖ This repo already has an "origin" remote, with value
# 2025-09-16T11:57:10-04:00   "https://github.com/gabrielodom/madlibs".
# 2025-09-16T11:57:10-04:00 ℹ You can remove this setting with:
# 2025-09-16T11:57:10-04:00   `usethis::use_git_remote("origin", url = NULL, overwrite = TRUE)`

# So, let's run the code they suggest:
usethis::use_git_remote("origin", url = NULL, overwrite = TRUE)
# Then, because this change is only local, I probably need to re-write the
# manifest:
rsconnect::writeManifest()

# Ok, so that absolutely didn't work...
# Trying something else


