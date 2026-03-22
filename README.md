# publish_repo
Publish local Maven repository to package registry 

# Configuration

Modify publish_repo.sh, the following need to be changed:

REPO_URL - Url to the publish API on your Gitea server
REPO_ID - Name given to your packages registry in settings.xml
LOCAL_REPO - Path to your local Maven repository to be uploaded

and for this line:
```
  for ((i=${#parts[@]}-4; i>4; i--)); do
```
the "4" in "i>4" needs to be one more than the path folders in LOCAL_REPO (i.e "var" + "opt" + "mavenrepo" + 1 = 4) 


# Execution

Run the bash script publish_repo.sh

# Further Information

See here for more information about Gitea's Maven package registry: https://docs.gitea.cn/en-us/usage/packages/maven

Note in particular:

To register the package registry you first need to add your access token to the settings.xml file:
```
<settings>
  <servers>
    <server>
      <id>giteaPackagesRepo</id>
      <configuration>
        <httpHeaders>
          <property>
            <name>Authorization</name>
            <value>token {access_token}</value>
          </property>
        </httpHeaders>
      </configuration>
    </server>
  </servers>
</settings>
```
