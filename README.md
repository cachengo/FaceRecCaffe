# FaceRecCaffe

This is the main service for the face recognition app. Right now, everything is intended to work in your /root folder alongside FaceRecDB, caffe, and opencv. This was originally all run as another user, so it should be pretty portable. 

In order to install this, perform the following steps:

1. Clone this repo to /root
2. Clone FaceRecDB to /root and perform the steps in the README
3. Clone /db to /
4. Clone /img to /
5. cd /root/FaceRecCaffe
6. pip install -r requirements.txt
7. cp startservices.sh /usr/bin/
8. Create an SSL key pair via https://www.ibm.com/support/knowledgecenter/en/SSWHYP_4.0.0/com.ibm.apimgmt.cmc.doc/task_apionprem_gernerate_self_signed_openSSL.html.
9. Look for dependency errors. You might have to modify your PYTHONPATH to get things working properly and in some cases, create links to your /usr/lib directory. It is not unheard of to have additional modules to pip install. 
10. apt-get install supervisor # installs the startup service to run at boot time
11. cp conf.d/facerec.conf /etc/supervisor/conf.d/
12. Type "supervisorctl" => "reread" => "add facerec"
13. apt-get install inotify-tools #if you haven't done so
14. apt-get install incron #if you haven't done so
15. echo "root" >> /etc/incron.allow
16 Enter the incrontab editor (incrontab -e) and add "/db/facerec.db IN_MODIFY /usr/bin/startservices.sh restart"

To manually start/stop/restart the services, simply type "startservices.sh start"
