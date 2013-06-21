JBoss BPM BAM Dashboard Builder on OpenShift 
============================================
Installing the JBoss BPM Dashboard Builder standalone on OpenShift was never easier!

This git repository helps you get up and running quickly with the JBoss BPM BAM Dashboard Builder.


Running on OpenShift
----------------------

Create an account at http://openshift.redhat.com/

Create a JBoss AS instance

    rhc app create -t jbossas-7 --from-code git://github.com/eschabell/openshift-bpm-bam-dashboard.git bampreview

There is one step to add the user login files that are not being correctly copied to the JBoss server:

    rhc app show bampreview

You need to locate the 'SSH' line in output of above command to use for 'scp' files:

  SSH:             xxxxxxxxxx@bampreview-inthe.rhcloud.com

Using the SSH line, copy the following files, then the login will work below.

     scp bampreview/.openshift/config/bam-*.properties xxxxxxxxxx@bampreview-inthe.rhcloud.com:~/jbossas/standalone/configuration/

That's it, you can now checkout your application at:

    http://bampreview-$your_domain.rhcloud.com     

Just follow the link provided to the designer login:

    http://bampreview-$your_domain.rhcloud.com/dashbuilder

    Login credentials

           user: erics

       password: erics

Releases
---------

- v1.0 running on JBoss AS 7, standalone BAM Dashboard Builder.

