# jb
A command line tool for keeping track of job applications.

## Usage
```
Usage: jb [OPTIONS]

  Track your job applications.
  
  Written by Gernot Ohner (@gernot-ohner)
  
Options:
    a, add        Adds a new application to the database
    s, show       Shows additional information about a single application
    u, update     Updates an applications status 
    rm, remove    Removes an application from the database
    ls, list      Lists all job applications currently in the database
```

## Detailed information and examples

### add
Example: `jb add`  

Starts a series of prompts (company name, roles, locations, url of the job listing, additional notes)
To 


### `show`
Example `jb show 1`  

Takes an additional argument $id, that is the id of one application currently in the database.  
Shows more detailed information about a single application

### `update`
Example: `jb update 3 waiting_for_2nd_interview`

Changes the status of application `$id` to `$new_status`  
Takes two additional arguments:  
1. the id of the application to update  
2. the desired new status  

### `remove`
Example: `jb rm 5`

Removes an application from the database.  
Takes an additional argument: The id of the application to remove.  

## Architecture

The data is stored in a `squlite` database directly in the repo.

## TODOs
For `add`, allow the user to provide all information directly when calling `jb` (non-interactive mode)