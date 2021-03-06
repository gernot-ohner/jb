# frozen_string_literal: true

def update_usage
  "usage: jb update/u $id $new_status
    update requires more arguments:
    1. the id of the entry to update
    2. the new status of that entry"
end

def show_usage
  "usage: jb show/s $id
    show requires more arguments:
    1. the id of the entry to show"
end

def remove_usage
  "usage: jb remove/rm $id
    remove requires more arguments:
    1. the id of the entry to remove"
end

def id_does_not_exist(id)
  "error: id #{id} does not exist in the database"
end
