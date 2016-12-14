function bbc-curl
{
	local url=$1
	echo "$(curl -s --cert bbc-cert.p12:$P12_PWD $url | python -mjson.tool )"
}

function bbc-wiki-content
{
	local page=$1
	echo "$(bbc-curl https://confluence.dev.bbc.co.uk/rest/api/content/$1)"

}

function bbc-test-content
{
	bbc-wiki-content 131322248?expand=body.storage
}

echo BBC-api is now enabled


# see https://bitbucket.org/jaysee00/confluence-rest-api-example/src/master/src/main/java/com/atlassian/api/examples/Main.java?fileviewer=file-view-default and https://answers.atlassian.com/questions/312039/how-to-update-a-page-in-confluence-5.5.3-via-rest-call
