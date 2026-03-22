# publish_repo
Publish local Maven repository to package registry 


See here for more information about Gitea's Maven package registry: https://docs.gitea.cn/en-us/usage/packages/maven

Note in particular:

To register the package registry you first need to add your access token to the settings.xml file:
```
<settings>
  <servers>
    <server>
      <id>gitea</id>
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
