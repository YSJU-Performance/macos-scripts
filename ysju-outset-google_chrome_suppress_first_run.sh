#!/bin/bash

# Creates a Google Chrome Master Preference file in the '/Library/Google/'
# directory to suppress first-run dialogs

cat > Library/Google/master_preferences << EOF
{
  homepage : "http://www.google.co.uk",
  homepage_is_newtabpage : false,
   first_run_tabs: [ "http://www.google.co.uk" ],
      homepage: "http://www.google.co.uk",
  browser : {
    show_home_button: true,
    show_update_promotion_info_bar: false,
    check_default_browser: false
  },
  distribution : {
    show_welcome_page : false,
    skip_first_run_ui : true,
    import_history : false,
    import_bookmarks : false,
    import_home_page : false,
    import_search_engine : false,
    suppress_first_run_bubble: true,
.ApacheDirectoryStudio/make_chrome_default: false,
    suppress_first_run_default_browser_prompt: true
  },
  sync_promo : {
    user_skipped : true
  },
.ApacheDirectoryStudio/proxy: {
      bypass_list: ,
      mode: system,
      server: 
   },   
   sync_promo: {
      user_skipped: true
   }
}
EOF
