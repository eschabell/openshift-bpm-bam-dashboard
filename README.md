Update: June 2018 moved to [Gitlab](https://gitlab.com/eschabell/openshift-bpm-bam-dashboard)


JBoss BPM BAM Dashboard Builder on OpenShift 
============================================
Installing the JBoss BPM Dashboard Builder standalone on OpenShift was never easier!

This git repository helps you get up and running quickly with the JBoss BPM BAM Dashboard Builder.


Running on OpenShift
----------------------

Create an account at http://openshift.redhat.com/

Create a JBoss AS instance

    rhc app create -t jbossas-7 --from-code git://github.com/eschabell/openshift-bpm-bam-dashboard.git bampreview

There is one step to add the user login files that are not being correctly copied to the JBoss server. Wsing the RHC SCP command, copy the following files, then the login will work below.

     rhc scp bampreview bampreview/.openshift/config/bam-*.properties jbossas/standalone/configuration/

That's it, you can now checkout your application at:

    http://bampreview-$your_domain.rhcloud.com     

Just follow the link provided to the designer login:

    http://bampreview-$your_domain.rhcloud.com/dashbuilder

    Login credentials

           user: erics

       password: erics


Screenshots
-----------

![BAM Dashbuilder](/images/login.png "Login")

![BAM Dashboard](/images/dashboard.png "Dashboard")


Releases
---------

- v1.1 running on JBoss AS 7, standalone product BAM Dashboard Builder.

- v1.0 running on JBoss AS 7, standalone BAM Dashboard Builder.

