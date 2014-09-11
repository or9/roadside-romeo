#Express Skeleton Getting Started
```
npm install -g express-generator
express appDirname
cd appDirname/
npm install 
npm start
```
Application listens on port 3000
`router.js` is the single router for Application
##Sample Postman Workflow
###Sample API

####Get Offer _[Unpublished]_  
URL: `/api/v1/offer/{offer_id}`  
Verb: `GET`  
Description: Returns the quote for the offer  
Response Formats: `json, xml`  
__Request__  
HTTP Headers [Name | Description | Required]  
>`Authorization` _Access token_ __Required__  
`Accept` [`application/json` | `application/xml`] __Required__   

Path Parameters [Name | Description]  
>`offer_id` _offerID_	 
Body: _None_   

__Response__ 
>HTTP Status Code: 200 (“OK”) 

_Possible Errors_ [Error Code | Description]
>`ERROR-500`: `Unable to process your request, please try again`.  

####Examples
__JSON Request__  
GET `/api/v1/offer/1234
HTTP Headers:
> `Accept: application/json  
> Authorization: Basic 1234567890abcdefghijklmnop
Body: _None_  
__JSON Response__
HTTP Status Code: `200`
Body:
```
{
	"id": "1234",
		"total": "45.00",
		"taxes": {
			"GST": "3.28",
			"PST":"3.28"
		}
}
```

