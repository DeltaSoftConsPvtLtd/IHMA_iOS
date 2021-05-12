//
//  WebServiceConstant.swift
//  IHMA
//
//  Created by Nikil Davis on 06/05/21.
//

import Foundation
import UIKit

//MARK:- Web service enums

enum HttpMethod {
    
    case get
    case post
}


enum ServiceMethodType
    
{
    case none
    case sidemenu
    case category
//    case categories
    
    case signIn
    case signUp
    case forgotPassword
    case resetPassword
    case feedback
    case verifyUser
    case resendEmailVerification
    case magazines
    case singleMagazine
    
    case articleList
    
    case reccomendedArticleList
    
    case postCommenturl
    case likeArticle
    case savedArticle
    case searchArticle
    case advertisement
    case newvideo
    case media_scan
    case editorial
    case editorialdetail
    case media_scandetail
    case events
    case token
    case singleArticleRelatedPost
    
    case prayerCategory
    case prayerList
    case prayerFavouriteList
}


var demoBaseUrl = "http://demo.webandcrafts.com/tidings/wp-json/"
var baseUrl = "http://lmsihma.co.in/"
var baseUrl1 = ""

var newVideo = "v1/live/stream"
var newvideoUrl = "5a79980b2e000048009a5b43"

var tokenRefreshurl = "v1/live/token"

let tabview_colorHex = "#e97900"
let firstcolor = "#e97900"
let secondcolor = "#fae75c"
let thirdcolor = "#f52e1e"

let category = "v1/category"

let userSignUp = "v1/register"
let userSignIn = "/api/login/"
let userForgotPassword = "v1/forget_password"
let userResetPassword = "v1/resetpassword"
let feedbackUrl = "v1/feedback"
let verifyUserUrl = "v1/email_varification"
let resendEmailVerificationUrl = "v1/resend_email_varification"
let magazinesUrl = "v1/magazines"
let singleMagazineUrl = "v1/magazine"
let singleArticleRelatedPostUrl = "v1/article"

let media_scan =  "v1/media_scan"
let media_scandetail = "v1/media_scan/detail"
let editorial = "v1/editorial"
let editorialdetail = "v1/editorial/detail"
let events = "v1/events"
let token = "v1/live/token"
let postCommenturl = "wp/v2/comments"
let likeArticleUrl = "v1/favorite"
let savedArticleUrl = "v1/favorite"
let searchArticleUrl = "v1/search"

let getAdvertisementUrl = "v1/adv"

//"jwt-auth/v1/token"
//"v2/comments"


let ariticleListUrl = "v1/article/list"

let prayerUrl = "v1/prayer/categories"
let prayerListUrl = "v1/prayer/list"
let prayerFavouriteUrl = "v1/prayer/favorite"



//MARK:- Web service completion handler closures


public typealias downloaderCompletionHandler = ((_ status:Bool, _ message:String?, _ responseObject:AnyObject?, _ error:NSError?) -> ())


typealias WebServiceCompletionHandler = (_ status:Bool, _ message:String?, _ responseObject:AnyObject?, _ error:NSError?) -> Void

//MARK:- Parameter constants

// Common API parameters used

// Keys
let WS_Param_Key_ApiKey = "api_key"
let WS_Param_Key_ContentType = "Content-Type"

let errorCode = "ErrCode"
let WS_Param_Key_Message = "msg"
let WS_Param_Key_Data = "Data"
let WS_Param_Key_Status = "status"


let WS_Param_Key_DeviceToken = "device_token"
let WS_Param_Key_VendorID = "vendor_id"
let WS_Param_Key_DeviceType = "device_type"

let WS_Param_Key_Login_SessionToken = "SessionToken"
let WS_Param_Key_SessionToken = "Authorization"

// values
let WS_ContentType = "application/json"
let WS_ApiKey = "123"

let WS_Param_DeviceType = 1

// Error parameters

let WS_ErrorCode_NoData = 999001
let WS_Error_NoData = "No data available"

let WS_ErrorCode_DataFormat = 999002
let WS_Error_DataFormat = "Data format error. Data contract breakage"

let WS_ErrorCode_UnKnown = 999003
let WS_Error_UnKnown = "Unknown error. But response obtained"

let noInternetConnectivityErrorCode = 999004
let noInternetConnectivityError = "No internet connectivity"

// HTTP Success code

let WS_HTTP_SuccessCode = 200
//HTTP Created code

let WS_HTTP_CreatedCode = 201
// HTTP Error codes

let WS_HTTP_ErrorCode_BadRequest = 400
let WS_HTTP_ErrorCode_UnAuthorizedAccess = 401
let WS_HTTP_ErrorCode_Forbidden = 403
let WS_HTTP_ErrorCode_ResourceNotFound = 404
let WS_HTTP_ErrorCode_TimeOut = 408
let WS_HTTP_ErrorCode_Other = 999999

let WS_HTTP_Error_BadRequest = "The server cannot or will not process the request due to an apparent client error"
let WS_HTTP_Error_UnAuthorizedAccess = "Access Server Permission denied"
let WS_HTTP_Error_Forbidden = "The request was a valid request, but the server is refusing to respond to it"
let WS_HTTP_Error_ResourceNotFound = "The requested resource could not be found but may be available in the future. Subsequent requests by the client are permissible"
let WS_HTTP_Error_TimeOut = "The server timed out waiting for the request"
let WS_HTTP_Error_Other = "HTTP error, other than general, frequent and popular errors"

// User Defaults parmeters
let WS_SessionTokenKey = "Authorization"
//MARK:- Service utility class

