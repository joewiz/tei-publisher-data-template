xquery version "3.1";

(: The following external variables are set by the repo:deploy function :)

(: file path pointing to the exist installation directory :)
declare variable $home external;
(: path to the directory containing the unpacked .xar package :)
declare variable $dir external;
(: the target collection into which the app is deployed :)
declare variable $target external;

xmldb:create-collection($target, "data"),
sm:chmod(xs:anyURI($target || "/data"), "rwxrwxr-x"),
sm:chown(xs:anyURI($target || "/data"), "tei"),
sm:chgrp(xs:anyURI($target || "/data"), "tei"),
xmldb:create-collection($target || "/data", "playground"),
sm:chmod(xs:anyURI($target || "/data/playground"), "rwxrwxr-x"),
sm:chown(xs:anyURI($target || "/data/playground"), "tei"),
sm:chgrp(xs:anyURI($target || "/data/playground"), "tei"),
xmldb:create-collection($target || "/data", "temp"),
sm:chmod(xs:anyURI($target || "/data/temp"), "rwxrwxr-x"),
sm:chown(xs:anyURI($target || "/data/temp"), "tei"),
sm:chgrp(xs:anyURI($target || "/data/temp"), "tei")