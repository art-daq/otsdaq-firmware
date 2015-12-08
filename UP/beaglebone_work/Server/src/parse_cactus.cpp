
#include <iostream>
#include "parse_cactus.h"
#include <dirent.h>
#include <errno.h>
#include <string.h>



using namespace std;

#define __COUT_HDR__ (std::string)((std::string)(__FILE__) + ":" + std::to_string(__LINE__) + ":" + __PRETTY_FUNCTION__ + "\t")

void recurse_dir(const char *);

const std::string BOARDS_DIR_NAME = "boards";
const std::string PROJECTS_DIR_NAME = "projects";
const std::string COMPONENTS_DIR_NAME = "components";

int parse_cactus()
{
	//////////////////////////////////////////////////////////
	//flow:
		//open the directory
    	//scan top level of hierarchy for path to boards, projects, and components
			//for boards
				//recursively find all boards' folders
					//get name, place-in-hierarchy, description, features, image
					//get setup_and_install with options
	//////////////////////////////////////////////////////////


	cout << __COUT_HDR__ << "Parsing cactus for components and feature lists" << endl;

	char cactus_path[5000] = "/home/rrivera/ots/srcs/otsdaq-firmware/cactus";

    DIR *dir; //the directory
    struct dirent *dp;


    //open the directory
    if((dir  = opendir(cactus_path)) == NULL)
    {
        cout << __COUT_HDR__ << "Error(" << errno << ") opening " << cactus_path << endl;
        return errno;
    }

    //scan top level of hierarchy for path to boards, projects, and components
    while ((dp = readdir(dir)) != NULL)
    {

    	if(!strcmp(dp->d_name,".") || !strcmp(dp->d_name,"..")) continue;

        cout << __COUT_HDR__ << dp->d_name << " " <<  (int)(dp->d_type) << endl;

        if(dp->d_type == 4) //directory
        {
        	if(dp->d_name)

        }
    }

    closedir(dir);


	return 0;
}

