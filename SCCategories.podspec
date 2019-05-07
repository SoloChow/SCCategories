
Pod::Spec.new do |s|
    s.name             = 'SCCategories'
    s.version          = '0.1.0'
    s.summary          = 'Cocoa框架基础分类组件'
    
    s.homepage         = 'https://github.com/SoloChow/SCCategories'
    s.license          = 'MIT'
    s.author           = { 'Solo' => 'mailzhouchunlong@foxmail.com' }
    s.source           = { :git => 'https://github.com/SoloChow/SCCategories.git', :tag => s.version }
    
    s.ios.deployment_target = '7.0'
    
    s.public_header_files = 'SCCategories/Classes/SCCategories.h'
    s.source_files = 'SCCategories/Classes/SCCategories.h'
    
    s.frameworks = 'UIKit', 'Foundation', 'QuartzCore', 'CoreGraphics'
    s.requires_arc = true
    
    # Foundation
    s.subspec 'Foundation' do |foundation|
        
        # NSArray
        foundation.subspec 'NSArray' do |nsarray|
            nsarray.source_files = 'SCCategories/Classes/Foundation/NSArray/NSArray+SCCategories.h'
            
            # NSArray+SCBase
            nsarray.subspec 'NSArray+SCBase' do |nsarray_scbase|
                nsarray_scbase.source_files = 'SCCategories/Classes/Foundation/NSArray/NSArray+SCBase.{h,m}'
            end
            
            # NSArray+SCJSSCArray
            nsarray.subspec 'NSArray+SCJSSCArray' do |nsarray_scjsonarray|
                nsarray_scjsonarray.source_files = 'SCCategories/Classes/Foundation/NSArray/NSArray+SCJSSCArray.{h,m}'
            end
            
            # NSArray+SCPropertyList
            nsarray.subspec 'NSArray+SCPropertyList' do |nsarray_scpropertylist|
                nsarray_scpropertylist.dependency 'SCCategories/Foundation/NSData/NSData+SCBase'
                nsarray_scpropertylist.source_files = 'SCCategories/Classes/Foundation/NSArray/NSArray+SCPropertyList.{h,m}'
            end
            
            # NSArray+SCSort.h
            nsarray.subspec 'NSArray+SCSort' do |nsarray_scsort|
                nsarray_scsort.source_files = 'SCCategories/Classes/Foundation/NSArray/NSArray+SCSort.{h,m}'
            end
        end
        
        # NSAttributedString NSMutableAttributedString
        foundation.subspec 'NSAttributedString' do |nsattributedstring|
            nsattributedstring.source_files = 'SCCategories/Classes/Foundation/NSAttributedString/NSAttributedString+SCCategories.{h,m}'
            
            # NSAttributedString+SCBase
            nsattributedstring.subspec 'NSAttributedString+SCBase' do |nsattributedstring_scbase|
                nsattributedstring_scbase.frameworks = 'UIKit', 'CoreText'
                nsattributedstring_scbase.dependency 'SCCategories/Foundation/NSValue/NSValue+SCBase'
                nsattributedstring_scbase.source_files = 'SCCategories/Classes/Foundation/NSAttributedString/NSAttributedString+SCBase.{h,m}'
            end
            
            # NSAttributedString+SCCreation
            nsattributedstring.subspec 'NSAttributedString+SCCreation' do |nsattributedstring_sccreation|
                nsattributedstring_sccreation.frameworks = 'UIKit'
                nsattributedstring_sccreation.dependency 'SCCategories/Foundation/NSAttributedString/NSAttributedString+SCBase'
                nsattributedstring_sccreation.source_files = 'SCCategories/Classes/Foundation/NSAttributedString/NSAttributedString+SCCreation.{h,m}'
            end
            
            # NSAttributedString+SCMask
            nsattributedstring.subspec 'NSAttributedString+SCMask' do |nsattributedstring_scmask|
                nsattributedstring_scmask.frameworks = 'UIKit'
                nsattributedstring_scmask.dependency 'SCCategories/Foundation/NSAttributedString/NSAttributedString+SCBase'
                nsattributedstring_scmask.dependency 'SCCategories/Foundation/NSValue/NSValue+SCBase'
                nsattributedstring_scmask.source_files = 'SCCategories/Classes/Foundation/NSAttributedString/NSAttributedString+SCMask.{h,m}'
            end
            
            # NSAttributedString+SCParagraphStyleAttributes
            nsattributedstring.subspec 'NSAttributedString+SCParagraphStyleAttributes' do |nsattributedstring_scparagraphstyleattributes|
                nsattributedstring_scparagraphstyleattributes.frameworks = 'UIKit'
                nsattributedstring_scparagraphstyleattributes.dependency 'SCCategories/Foundation/NSAttributedString/NSAttributedString+SCBase'
                nsattributedstring_scparagraphstyleattributes.source_files = 'SCCategories/Classes/Foundation/NSAttributedString/NSAttributedString+SCParagraphStyleAttributes.{h,m}'
            end
        end
        
        # NSBundle
        foundation.subspec 'NSBundle' do |nsbundle|
            nsbundle.source_files = 'SCCategories/Classes/Foundation/NSBundle/NSBundle+SCCategories.{h,m}'
            
            # NSBundle+SCBase
            nsbundle.subspec 'NSBundle+SCBase' do |nsbundle_scbase|
                nsbundle_scbase.source_files = 'SCCategories/Classes/Foundation/NSBundle/NSBundle+SCBase.{h,m}'
            end
        end
        
        # NSCalendar
        foundation.subspec 'NSCalendar' do |nscalendar|
            nscalendar.source_files = 'SCCategories/Classes/Foundation/NSCalendar/NSCalendar+SCCategories.{h,m}'
            
            # NSCalendar +SCBase
            nscalendar.subspec 'NSCalendar+SCBase' do |nscalendar_scbase|
                nscalendar_scbase.source_files = 'SCCategories/Classes/Foundation/NSCalendar/NSCalendar+SCBase.{h,m}'
            end
        end
        
        # NSData
        foundation.subspec 'NSData' do |nsdata|
            nsdata.source_files = 'SCCategories/Classes/Foundation/NSData/NSData+SCCategories.{h,m}'
            
            # NSData+SCBase
            nsdata.subspec 'NSData+SCBase' do |nsdata_scbase|
                nsdata_scbase.source_files = 'SCCategories/Classes/Foundation/NSData/NSData+SCBase.{h,m}'
            end
            
            # NSData+SCBase64
            nsdata.subspec 'NSData+SCBase64' do |nsdata_scbase64|
                nsdata_scbase64.source_files = 'SCCategories/Classes/Foundation/NSData/NSData+SCBase64.{h,m}'
            end
            
            # NSData+SCEncryptAndDecrypt
            nsdata.subspec 'NSData+SCEncryptAndDecrypt' do |nsdata_scencryptanddecrypt|
                nsdata_scencryptanddecrypt.source_files = 'SCCategories/Classes/Foundation/NSData/NSData+SCEncryptAndDecrypt.{h,m}'
            end
            
            # NSData+SCHash
            nsdata.subspec 'NSData+SCHash' do |nsdata_schash|
                nsdata_schash.library = 'z.1.2.5'
                nsdata_schash.source_files = 'SCCategories/Classes/Foundation/NSData/NSData+SCHash.{h,m}'
            end
            
            # NSData+SCJSSCValue
            nsdata.subspec 'NSData+SCJSSCValue' do |nsdata_scjsonvalue|
                nsdata_scjsonvalue.source_files = 'SCCategories/Classes/Foundation/NSData/NSData+SCJSSCValue.{h,m}'
            end
            
            # NSData+SCPackAndUnpack
            nsdata.subspec 'NSData+SCPackAndUnpack' do |nsdata_scpackandunpack|
                nsdata_scpackandunpack.library = 'z.1.2.5'
                nsdata_scpackandunpack.source_files = 'SCCategories/Classes/Foundation/NSData/NSData+SCPackAndUnpack.{h,m}'
            end
        end
        
        # NSDate
        foundation.subspec 'NSDate' do |nsdate|
            nsdate.source_files = 'SCCategories/Classes/Foundation/NSDate/NSDate+SCCategories.{h,m}'
            
            # NSDate+SCBase
            nsdate.subspec 'NSDate+SCBase' do |nsdate_scbase|
                nsdate_scbase.source_files = 'SCCategories/Classes/Foundation/NSDate/NSDate+SCBase.{h,m}'
            end
            
            # NSDate+SCDateFormat
            nsdate.subspec 'NSDate+SCDateFormat' do |nsdate_scdateformat|
                nsdate_scdateformat.source_files = 'SCCategories/Classes/Foundation/NSDate/NSDate+SCDateFormat.{h,m}'
            end
        end
        
        # NSDecimalNumber
        foundation.subspec 'NSDecimalNumber' do |nsdecimalNumber|
            nsdecimalNumber.source_files = 'SCCategories/Classes/Foundation/NSDecimalNumber/NSDecimalNumber+SCCategories.{h,m}'
            
            # NSDecimalNumber+SCBase
            nsdecimalNumber.subspec 'NSDecimalNumber+SCBase' do |nsdecimalnumber_scbase|
                nsdecimalnumber_scbase.source_files = 'SCCategories/Classes/Foundation/NSDecimalNumber/NSDecimalNumber+SCBase.{h,m}'
            end
            
            # NSDecimalNumber+SCRoundNumber
            nsdecimalNumber.subspec 'NSDecimalNumber+SCRoundNumber' do |nsdecimalnumber_scroundnumber|
                nsdecimalnumber_scroundnumber.source_files = 'SCCategories/Classes/Foundation/NSDecimalNumber/NSDecimalNumber+SCRoundNumber.{h,m}'
            end
        end
        
        # NSDictionary
        foundation.subspec 'NSDictionary' do |nsdictionary|
            nsdictionary.source_files = 'SCCategories/Classes/Foundation/NSDictionary/NSDictionary+SCCategories.{h,m}'
            
            # NSDictionary+SCBase
            nsdictionary.subspec 'NSDictionary+SCBase' do |nsdictionary_scbase|
                nsdictionary_scbase.source_files = 'SCCategories/Classes/Foundation/NSDictionary/NSDictionary+SCBase.{h,m}'
            end
            
            # NSDictionary+SCJSSCDictionary
            nsdictionary.subspec 'NSDictionary+SCJSSCDictionary' do |nsdictionary_scjsondictionary|
                nsdictionary_scjsondictionary.source_files = 'SCCategories/Classes/Foundation/NSDictionary/NSDictionary+SCJSSCDictionary.{h,m}'
            end
            
            # NSDictionary+SCPropertyList
            nsdictionary.subspec 'NSDictionary+SCPropertyList' do |nsdictionary_scpropertylist|
                nsdictionary_scpropertylist.dependency 'SCCategories/Foundation/NSData/NSData+SCBase'
                nsdictionary_scpropertylist.source_files = 'SCCategories/Classes/Foundation/NSDictionary/NSDictionary+SCPropertyList.{h,m}'
            end
        end
        
        # NSFileManager
        foundation.subspec 'NSFileManager' do |nsfilemanager|
            nsfilemanager.source_files = 'SCCategories/Classes/Foundation/NSFileManager/NSFileManager+SCCategories.{h,m}'
            
            # NSFileManager+SCBase
            nsfilemanager.subspec 'NSFileManager+SCBase' do |nsfilemanager_scbase|
                nsfilemanager_scbase.source_files = 'SCCategories/Classes/Foundation/NSFileManager/NSFileManager+SCBase.{h,m}'
            end
        end
        
        # NSIndexPath
        foundation.subspec 'NSIndexPath' do |nsindexpath|
            nsindexpath.source_files = 'SCCategories/Classes/Foundation/NSIndexPath/NSIndexPath+SCCategories.{h,m}'
            
            # NSIndexPath+SCBase
            nsindexpath.subspec 'NSIndexPath+SCBase' do |nsindexpath_scbase|
                nsindexpath_scbase.source_files = 'SCCategories/Classes/Foundation/NSIndexPath/NSIndexPath+SCBase.{h,m}'
            end
        end
        
        # NSJSSCSerialization
        foundation.subspec 'NSJSSCSerialization' do |nsjsonserialization|
            nsjsonserialization.source_files = 'SCCategories/Classes/Foundation/NSJSSCSerialization/NSJSSCSerialization+SCCategories.{h,m}'
            
            # NSJSSCSerialization+SCBase
            nsjsonserialization.subspec 'NSJSSCSerialization+SCBase' do |nsjsonserialization_scbase|
                nsjsonserialization_scbase.source_files = 'SCCategories/Classes/Foundation/NSJSSCSerialization/NSJSSCSerialization+SCBase.{h,m}'
            end
        end
        
        # NSKeyedArchiver
        foundation.subspec 'NSKeyedArchiver' do |nskeyedarchiver|
            nskeyedarchiver.source_files = 'SCCategories/Classes/Foundation/NSKeyedArchiver/NSKeyedArchiver+SCCategories.{h,m}'
            
            # NSKeyedArchiver+SCBase
            nskeyedarchiver.subspec 'NSKeyedArchiver+SCBase' do |nskeyedarchiver_scbase|
                nskeyedarchiver_scbase.source_files = 'SCCategories/Classes/Foundation/NSKeyedArchiver/NSKeyedArchiver+SCBase.{h,m}'
            end
        end
        
        # NSNotificationCenter
        foundation.subspec 'NSNotificationCenter' do |nsnotificationcenter|
            nsnotificationcenter.source_files = 'SCCategories/Classes/Foundation/NSNotificationCenter/NSNotificationCenter+SCCategories.{h,m}'
            
            # NSNotificationCenter+SCBase
            nsnotificationcenter.subspec 'NSNotificationCenter+SCBase' do |nsnotificationcenter_scbase|
                nsnotificationcenter_scbase.source_files = 'SCCategories/Classes/Foundation/NSNotificationCenter/NSNotificationCenter+SCBase.{h,m}'
            end
        end
        
        # NSNumber
        foundation.subspec 'NSNumber' do |nsnumber|
            nsnumber.source_files = 'SCCategories/Classes/Foundation/NSNumber/NSNumber+SCCategories.{h,m}'
            
            # NSNumber+SCBase
            nsnumber.subspec 'NSNumber+SCBase' do |nsnumber_scbase|
                nsnumber_scbase.source_files = 'SCCategories/Classes/Foundation/NSNumber/NSNumber+SCBase.{h,m}'
            end
        end
        
        # NSObject
        foundation.subspec 'NSObject' do |nsobject|
            nsobject.source_files = 'SCCategories/Classes/Foundation/NSObject/NSObject+SCCategories.{h,m}'
            
            # NSObject+SCAssociatedValue
            nsobject.subspec 'NSObject+SCAssociatedValue' do |nsobject_scassociatedvalue|
                nsobject_scassociatedvalue.source_files = 'SCCategories/Classes/Foundation/NSObject/NSObject+SCAssociatedValue.{h,m}'
            end
            
            # NSObject+SCBase
            nsobject.subspec 'NSObject+SCBase' do |nsobject_scbase|
                nsobject_scbase.source_files = 'SCCategories/Classes/Foundation/NSObject/NSObject+SCBase.{h,m}'
            end
            
            # NSObject+SCKeyValueCoding
            nsobject.subspec 'NSObject+SCKeyValueCoding' do |nsobject_sckeyvaluecoding|
                nsobject_sckeyvaluecoding.source_files = 'SCCategories/Classes/Foundation/NSObject/NSObject+SCKeyValueCoding.{h,m}'
            end
            
            # NSObject+SCKeyValueObserving
            nsobject.subspec 'NSObject+SCKeyValueObserving' do |nsobject_sckeyvalueobserving|
                nsobject_sckeyvalueobserving.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                nsobject_sckeyvalueobserving.source_files = 'SCCategories/Classes/Foundation/NSObject/NSObject+SCKeyValueObserving.{h,m}'
            end
            
            # NSObject+SCSwizzleMethod
            nsobject.subspec 'NSObject+SCSwizzleMethod' do |nsobject_scswizzlemethod|
                nsobject_scswizzlemethod.source_files = 'SCCategories/Classes/Foundation/NSObject/NSObject+SCSwizzleMethod.{h,m}'
            end
        end
        
        # NSParagraphStyle
        foundation.subspec 'NSParagraphStyle' do |nsparagraphstyle|
            nsparagraphstyle.source_files = 'SCCategories/Classes/Foundation/NSParagraphStyle/NSParagraphStyle+SCCategories.{h,m}'
            
            # NSParagraphStyle+SCBase
            nsparagraphstyle.subspec 'NSParagraphStyle+SCBase' do |nsparagraphstyle_scbase|
                nsparagraphstyle_scbase.frameworks = 'CoreText'
                nsparagraphstyle_scbase.source_files = 'SCCategories/Classes/Foundation/NSParagraphStyle/NSParagraphStyle+SCBase.{h,m}'
            end
        end
        
        # NSSet
        foundation.subspec 'NSSet' do |nsset|
            nsset.source_files = 'SCCategories/Classes/Foundation/NSSet/NSSet+SCCategories.{h,m}'
            
            # NSSet+SCBase
            nsset.subspec 'NSSet+SCBase' do |nsset_scbase|
                nsset_scbase.source_files = 'SCCategories/Classes/Foundation/NSSet/NSSet+SCBase.{h,m}'
            end
        end
        
        # NSString
        foundation.subspec 'NSString' do |nsstring|
            nsstring.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCCategories.{h,m}'
            
            # NSString+SCBase
            nsstring.subspec 'NSString+SCBase' do |nsstring_scbase|
                nsstring_scbase.dependency 'SCCategories/Foundation/NSData/NSData+SCBase'
                nsstring_scbase.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCBase.{h,m}'
            end
            
            # NSString+SCBase64String
            nsstring.subspec 'NSString+SCBase64String' do |nsstring_scbase64string|
                nsstring_scbase64string.dependency 'SCCategories/Foundation/NSData/NSData+SCBase64'
                nsstring_scbase64string.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCBase64String.{h,m}'
            end
            
            # NSString+SCCheck
            nsstring.subspec 'NSString+SCCheck' do |nsstring_sccheck|
                nsstring_sccheck.dependency 'SCCategories/Foundation/NSString/NSString+SCBase'
                nsstring_sccheck.dependency 'SCCategories/Foundation/NSString/NSString+SCRegularExpression'
                nsstring_sccheck.dependency 'SCCategories/Foundation/NSDictionary/NSDictionary+SCBase'
                nsstring_sccheck.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCCheck.{h,m}'
            end
            
            # NSString+SCChinese
            nsstring.subspec 'NSString+SCChinese' do |nsstring_scchinese|
                nsstring_scchinese.dependency 'SCCategories/Foundation/NSString/NSString+SCRegularExpression'
                nsstring_scchinese.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCChinese.{h,m}'
            end
            
            # NSString+SCDrawing
            nsstring.subspec 'NSString+SCDrawing' do |nsstring_scdrawing|
                nsstring_scdrawing.frameworks = 'UIKit', 'CoreGraphics'
                nsstring_scdrawing.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCDrawing.{h,m}'
            end
            
            # NSString+SCEmoji
            nsstring.subspec 'NSString+SCEmoji' do |nsstring_scemoji|
                nsstring_scemoji.dependency 'SCCategories/Foundation/NSString/NSString+SCBase'
                nsstring_scemoji.dependency 'SCCategories/Foundation/NSString/NSString+SCRegularExpression'
                nsstring_scemoji.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCEmoji.{h,m}'
            end
            
            # NSString+SCHashString
            nsstring.subspec 'NSString+SCHashString' do |nsstring_schashstring|
                nsstring_schashstring.dependency 'SCCategories/Foundation/NSData/NSData+SCHash'
                nsstring_schashstring.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCHashString.{h,m}'
            end
            
            # NSString+SCNumberValue
            nsstring.subspec 'NSString+SCNumberValue' do |nsstring_scnumbervalue|
                nsstring_scnumbervalue.dependency 'SCCategories/Foundation/NSNumber/NSNumber+SCBase'
                nsstring_scnumbervalue.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCNumberValue.{h,m}'
            end
            
            # NSString+SCPathString
            nsstring.subspec 'NSString+SCPathString' do |nsstring_scpathstring|
                nsstring_scpathstring.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCPathString.{h,m}'
            end
            
            # NSString+SCPinyin
            nsstring.subspec 'NSString+SCPinyin' do |nsstring_scpinyin|
                nsstring_scpinyin.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCPinyin.{h,m}'
            end
            
            # NSString+SCRegularExpression
            nsstring.subspec 'NSString+SCRegularExpression' do |nsstring_scregularexpression|
                nsstring_scregularexpression.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCRegularExpression.{h,m}'
            end
            
            # NSString+SCRoundNumberString
            nsstring.subspec 'NSString+SCRoundNumberString' do |nsstring_scroundnumberstring|
                nsstring_scroundnumberstring.dependency 'SCCategories/Foundation/NSDecimalNumber/NSDecimalNumber+SCRoundNumber'
                nsstring_scroundnumberstring.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCRoundNumberString.{h,m}'
            end
            
            # NSString+SCSecurityString
            nsstring.subspec 'NSString+SCSecurityString' do |nsstring_scsecuritystring|
                nsstring_scsecuritystring.dependency 'SCCategories/Foundation/NSString/NSString+SCBase'
                nsstring_scsecuritystring.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCSecurityString.{h,m}'
            end
            
            # NSString+SCTrimming
            nsstring.subspec 'NSString+SCTrimming' do |nsstring_sctrimming|
                nsstring_sctrimming.dependency 'SCCategories/Foundation/NSString/NSString+SCRegularExpression'
                nsstring_sctrimming.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCTrimming.{h,m}'
            end
            
            # NSString+SCURLString
            nsstring.subspec 'NSString+SCURLString' do |nsstring_scurlstring|
                nsstring_scurlstring.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCURLString.{h,m}'
            end
            
            # NSString+SCUTF32String
            nsstring.subspec 'NSString+SCUTF32String' do |nsstring_scutf32string|
                nsstring_scutf32string.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCUTF32String.{h,m}'
            end
            
            # NSString+SCUUIDString
            nsstring.subspec 'NSString+SCUUIDString' do |nsstring_scuuidstring|
                nsstring_scuuidstring.source_files = 'SCCategories/Classes/Foundation/NSString/NSString+SCUUIDString.{h,m}'
            end
        end
        
        # NSThread
        foundation.subspec 'NSThread' do |nsthread|
            nsthread.source_files = 'SCCategories/Classes/Foundation/NSThread/NSThread+SCCategories.{h,m}'
            
            # NSThread+SCBase
            nsthread.subspec 'NSThread+SCBase' do |nsthread_scbase|
                nsthread_scbase.source_files = 'SCCategories/Classes/Foundation/NSThread/NSThread+SCBase.{h,m}'
            end
        end
        
        # NSTimer
        foundation.subspec 'NSTimer' do |nstimer|
            nstimer.source_files = 'SCCategories/Classes/Foundation/NSTimer/NSTimer+SCCategories.{h,m}'
            
            # NSTimer+SCBase
            nstimer.subspec 'NSTimer+SCBase' do |nstimer_scbase|
                nstimer_scbase.source_files = 'SCCategories/Classes/Foundation/NSTimer/NSTimer+SCBase.{h,m}'
            end
        end
        
        # NSURLComponents
        foundation.subspec 'NSURLComponents' do |nsurlcomponents|
            nsurlcomponents.source_files = 'SCCategories/Classes/Foundation/NSURLComponents/NSURLComponents+SCCategories.{h,m}'
            
            # NSURLComponents+SCBase
            nsurlcomponents.subspec 'NSURLComponents+SCBase' do |nsurlcomponents_scbase|
                nsurlcomponents_scbase.source_files = 'SCCategories/Classes/Foundation/NSURLComponents/NSURLComponents+SCBase.{h,m}'
            end
        end
        
        # NSValue
        foundation.subspec 'NSValue' do |nsvalue|
            nsvalue.source_files = 'SCCategories/Classes/Foundation/NSValue/NSValue+SCCategories.{h,m}'
            
            # NSValue+SCBase
            nsvalue.subspec 'NSValue+SCBase' do |nsvalue_scbase|
                nsvalue_scbase.frameworks = 'CoreGraphics'
                nsvalue_scbase.source_files = 'SCCategories/Classes/Foundation/NSValue/NSValue+SCBase.{h,m}'
            end
        end
        
    end
    
    # UIKit
    s.subspec 'UIKit' do |uikit|
        
        # UIApplication
        uikit.subspec 'UIApplication' do |uiapplication|
            uiapplication.source_files = 'SCCategories/Classes/UIKit/UIApplication/UIApplication+SCCategories.{h,m}'
            
            # UIApplication+SCBase
            uiapplication.subspec 'UIApplication+SCBase' do |uiapplication_scbase|
                uiapplication_scbase.dependency 'SCCategories/Foundation/NSString/NSString+SCPathString'
                uiapplication_scbase.dependency 'SCCategories/UIKit/UIDevice/UIDevice+SCBase'
                uiapplication_scbase.source_files = 'SCCategories/Classes/UIKit/UIApplication/UIApplication+SCBase.{h,m}'
            end
            
            # UIApplication+SCNetworkActivityIndicator
            uiapplication.subspec 'UIApplication+SCNetworkActivityIndicator' do |uiapplication_scnetworkactivityindicator|
                uiapplication_scnetworkactivityindicator.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uiapplication_scnetworkactivityindicator.source_files = 'SCCategories/Classes/UIKit/UIApplication/UIApplication+SCNetworkActivityIndicator.{h,m}'
            end
            
            # UIApplication+SCTopViewController
            uiapplication.subspec 'UIApplication+SCTopViewController' do |uiapplication_sctopviewcontroller|
                uiapplication_sctopviewcontroller.source_files = 'SCCategories/Classes/UIKit/UIApplication/UIApplication+SCTopViewController.{h,m}'
            end
        end
        
        # UIBarButtonItem
        uikit.subspec 'UIBarButtonItem' do |uibarbuttonitem|
            uibarbuttonitem.source_files = 'SCCategories/Classes/UIKit/UIBarButtonItem/UIBarButtonItem+SCCategories.{h,m}'
            
            # UIBarButtonItem+SCBase
            uibarbuttonitem.subspec 'UIBarButtonItem+SCBase' do |uibarbuttonitem_scbase|
                uibarbuttonitem_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uibarbuttonitem_scbase.dependency 'SCCategories/UIKit/UIControl/UIControl+SCBase'
                uibarbuttonitem_scbase.dependency 'SCCategories/UIKit/UIGestureRecognizer/UIGestureRecognizer+SCBase'
                uibarbuttonitem_scbase.dependency 'SCCategories/UIKit/UIView/UIView+SCLayout'
                uibarbuttonitem_scbase.source_files = 'SCCategories/Classes/UIKit/UIBarButtonItem/UIBarButtonItem+SCBase.{h,m}'
            end
        end
        
        # UIBezierPath
        uikit.subspec 'UIBezierPath' do |uibezierpath|
            uibezierpath.source_files = 'SCCategories/Classes/UIKit/UIBezierPath/UIBezierPath+SCCategories.{h,m}'
            
            # UIBezierPath+SCBase
            uibezierpath.subspec 'UIBezierPath+SCBase' do |uibezierpath_scbase|
                uibezierpath_scbase.source_files = 'SCCategories/Classes/UIKit/UIBezierPath/UIBezierPath+SCBase.{h,m}'
            end
        end
        
        # UIButton
        uikit.subspec 'UIButton' do |uibutton|
            uibutton.source_files = 'SCCategories/Classes/UIKit/UIButton/UIButton+SCCategories.{h,m}'
            
            # UIButton+SCBase
            uibutton.subspec 'UIButton+SCBase' do |uibutton_scbase|
                uibutton_scbase.source_files = 'SCCategories/Classes/UIKit/UIButton/UIButton+SCBase.{h,m}'
            end
            
            # UIButton+SCConfigureForState
            uibutton.subspec 'UIButton+SCConfigureForState' do |uibutton_scconfigureforstate|
                uibutton_scconfigureforstate.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uibutton_scconfigureforstate.dependency 'SCCategories/Foundation/NSObject/NSObject+SCSwizzleMethod'
                uibutton_scconfigureforstate.source_files = 'SCCategories/Classes/UIKit/UIButton/UIButton+SCConfigureForState.{h,m}'
            end
            
            # UIButton+SCCountDown
            uibutton.subspec 'UIButton+SCCountDown' do |uibutton_sccountdown|
                uibutton_sccountdown.dependency 'SCCategories/UIKit/UIView/UIView+SCCountDown'
                uibutton_sccountdown.source_files = 'SCCategories/Classes/UIKit/UIButton/UIButton+SCCountDown.{h,m}'
            end
        end
        
        # UICollectionView
        uikit.subspec 'UICollectionView' do |uicollectionview|
            uicollectionview.source_files = 'SCCategories/Classes/UIKit/UICollectionView/UICollectionView+SCCategories.{h,m}'
            
            # UICollectionView+SCBase
            uicollectionview.subspec 'UICollectionView+SCBase' do |uicollectionview_scbase|
                uicollectionview_scbase.dependency 'SCCategories/Foundation/NSArray/NSArray+SCSort'
                uicollectionview_scbase.source_files = 'SCCategories/Classes/UIKit/UICollectionView/UICollectionView+SCBase.{h,m}'
            end
        end
        
        # UICollectionViewFlowLayout
        uikit.subspec 'UICollectionViewFlowLayout' do |uicollectionviewflowlayout|
            uicollectionviewflowlayout.source_files = 'SCCategories/Classes/UIKit/UICollectionViewFlowLayout/UICollectionViewFlowLayout+SCCategories.{h,m}'
            
            # UICollectionViewFlowLayout+SCBase
            uicollectionviewflowlayout.subspec 'UICollectionViewFlowLayout+SCBase' do |uicollectionviewflowlayout_scbase|
                uicollectionviewflowlayout_scbase.source_files = 'SCCategories/Classes/UIKit/UICollectionViewFlowLayout/UICollectionViewFlowLayout+SCBase.{h,m}'
            end
        end
        
        # UIColor
        uikit.subspec 'UIColor' do |uicolor|
            uicolor.source_files = 'SCCategories/Classes/UIKit/UIColor/UIColor+SCCategories.{h,m}'
            
            # UIColor+SCBase
            uicolor.subspec 'UIColor+SCBase' do |uicolor_scbase|
                uicolor_scbase.source_files = 'SCCategories/Classes/UIKit/UIColor/UIColor+SCBase.{h,m}'
            end
            
            # UIColor+SCCMYKColor
            uicolor.subspec 'UIColor+SCCMYKColor' do |uicolor_sccmykcolor|
                uicolor_sccmykcolor.dependency 'SCCategories/UIKit/UIColor/UIColor+SCColorConvert'
                uicolor_sccmykcolor.source_files = 'SCCategories/Classes/UIKit/UIColor/UIColor+SCCMYKColor.{h,m}'
            end
            
            # UIColor+SCColorConvert
            uicolor.subspec 'UIColor+SCColorConvert' do |uicolor_sccolorconvert|
                uicolor_sccolorconvert.source_files = 'SCCategories/Classes/UIKit/UIColor/UIColor+SCColorConvert.{h,m}'
            end
            
            # UIColor+SCHSBColor
            uicolor.subspec 'UIColor+SCHSBColor' do |uicolor_schsbcolor|
                uicolor_schsbcolor.dependency 'SCCategories/UIKit/UIColor/UIColor+SCColorConvert'
                uicolor_schsbcolor.source_files = 'SCCategories/Classes/UIKit/UIColor/UIColor+SCHSBColor.{h,m}'
            end
            
            # UIColor+SCHSLColor
            uicolor.subspec 'UIColor+SCHSLColor' do |uicolor_schslcolor|
                uicolor_schslcolor.dependency 'SCCategories/UIKit/UIColor/UIColor+SCColorConvert'
                uicolor_schslcolor.source_files = 'SCCategories/Classes/UIKit/UIColor/UIColor+SCHSLColor.{h,m}'
            end
        end
        
        # UIControl
        uikit.subspec 'UIControl' do |uicontrol|
            uicontrol.source_files = 'SCCategories/Classes/UIKit/UIControl/UIControl+SCCategories.{h,m}'
            
            # UIControl+SCBase
            uicontrol.subspec 'UIControl+SCBase' do |uicontrol_scbase|
                uicontrol_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uicontrol_scbase.source_files = 'SCCategories/Classes/UIKit/UIControl/UIControl+SCBase.{h,m}'
            end
            
            # UIControl+SCRepeatClickPrevention
            uicontrol.subspec 'UIControl+SCRepeatClickPrevention' do |uicontrol_screpeatclickprevention|
                uicontrol_screpeatclickprevention.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uicontrol_screpeatclickprevention.dependency 'SCCategories/Foundation/NSObject/NSObject+SCSwizzleMethod'
                uicontrol_screpeatclickprevention.source_files = 'SCCategories/Classes/UIKit/UIControl/UIControl+SCRepeatClickPrevention.{h,m}'
            end
        end
        
        # UIDevice
        uikit.subspec 'UIDevice' do |uidevice|
            uidevice.source_files = 'SCCategories/Classes/UIKit/UIDevice/UIDevice+SCCategories.{h,m}'
            
            # UIDevice+SCBase
            uidevice.subspec 'UIDevice+SCBase' do |uidevice_scbase|
                uidevice_scbase.dependency 'SCCategories/Foundation/NSString/NSString+SCUUIDString'
                uidevice_scbase.dependency 'SCCategories/Foundation/NSNumber/NSNumber+SCBase'
                uidevice_scbase.source_files = 'SCCategories/Classes/UIKit/UIDevice/UIDevice+SCBase.{h,m}'
            end
            
            # UIDevice+SCCPUInfo
            uidevice.subspec 'UIDevice+SCCPUInfo' do |uidevice_sccpuinfo|
                uidevice_sccpuinfo.source_files = 'SCCategories/Classes/UIKit/UIDevice/UIDevice+SCCPUInfo.{h,m}'
            end
            
            # UIDevice+SCDiskInfo
            uidevice.subspec 'UIDevice+SCDiskInfo' do |uidevice_scdiskinfo|
                uidevice_scdiskinfo.source_files = 'SCCategories/Classes/UIKit/UIDevice/UIDevice+SCDiskInfo.{h,m}'
            end
            
            # UIDevice+SCMemoryInfo
            uidevice.subspec 'UIDevice+SCMemoryInfo' do |uidevice_scmemoryinfo|
                uidevice_scmemoryinfo.source_files = 'SCCategories/Classes/UIKit/UIDevice/UIDevice+SCMemoryInfo.{h,m}'
            end
            
            # UIDevice+SCNetworkInfo
            uidevice.subspec 'UIDevice+SCNetworkInfo' do |uidevice_scnetworkinfo|
                uidevice_scnetworkinfo.source_files = 'SCCategories/Classes/UIKit/UIDevice/UIDevice+SCNetworkInfo.{h,m}'
            end
            
            # UIDevice+SCSIMInfo
            uidevice.subspec 'UIDevice+SCSIMInfo' do |uidevice_scsiminfo|
                uidevice_scsiminfo.frameworks = 'CoreTelephony'
                uidevice_scsiminfo.source_files = 'SCCategories/Classes/UIKit/UIDevice/UIDevice+SCSIMInfo.{h,m}'
            end
        end
        
        # UIFont
        uikit.subspec 'UIFont' do |uifont|
            uifont.source_files = 'SCCategories/Classes/UIKit/UIFont/UIFont+SCCategories.{h,m}'
            
            # UIFont+SCBase
            uifont.subspec 'UIFont+SCBase' do |uifont_scbase|
                uifont_scbase.frameworks = 'CoreText', 'CoreGraphics'
                uifont_scbase.source_files = 'SCCategories/Classes/UIKit/UIFont/UIFont+SCBase.{h,m}'
            end
        end
        
        # UIGestureRecognizer
        uikit.subspec 'UIGestureRecognizer' do |uigesturerecognizer|
            uigesturerecognizer.source_files = 'SCCategories/Classes/UIKit/UIGestureRecognizer/UIGestureRecognizer+SCCategories.{h,m}'
            
            # UIGestureRecognizer+SCBase
            uigesturerecognizer.subspec 'UIGestureRecognizer+SCBase' do |uigesturerecognizer_scbase|
                uigesturerecognizer_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uigesturerecognizer_scbase.source_files = 'SCCategories/Classes/UIKit/UIGestureRecognizer/UIGestureRecognizer+SCBase.{h,m}'
            end
        end
        
        # UIImage
        uikit.subspec 'UIImage' do |uiimage|
            uiimage.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCCategories.{h,m}'
            
            # UIImage+SCBase
            uiimage.subspec 'UIImage+SCBase' do |uiimage_scbase|
                uiimage_scbase.dependency 'SCCategories/CoreGraphic'
                uiimage_scbase.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCBase.{h,m}'
            end
            
            # UIImage+SCBlurredImage
            uiimage.subspec 'UIImage+SCBlurredImage' do |uiimage_scblurredimage|
                uiimage_scblurredimage.frameworks = 'Accelerate'
                uiimage_scblurredimage.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCBlurredImage.{h,m}'
            end
            
            # UIImage+SCColoredImage
            uiimage.subspec 'UIImage+SCColoredImage' do |uiimage_sccoloredimage|
                uiimage_sccoloredimage.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCColoredImage.{h,m}'
            end
            
            # UIImage+SCEmojiImage
            uiimage.subspec 'UIImage+SCEmojiImage' do |uiimage_scemojiimage|
                uiimage_scemojiimage.frameworks = 'CoreText'
                uiimage_scemojiimage.dependency 'SCCategories/Foundation/NSString/NSString+SCEmoji'
                uiimage_scemojiimage.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCEmojiImage.{h,m}'
            end
            
            # UIImage+SCGIFImage
            uiimage.subspec 'UIImage+SCGIFImage' do |uiimage_scgifimage|
                uiimage_scgifimage.frameworks = 'ImageIO'
                uiimage_scgifimage.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCGIFImage.{h,m}'
            end
            
            # UIImage+SCGradientImage
            uiimage.subspec 'UIImage+SCGradientImage' do |uiimage_scgradientImage|
                uiimage_scgradientImage.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCGradientImage.{h,m}'
            end
            
            # UIImage+SCImageBorder
            uiimage.subspec 'UIImage+SCImageBorder' do |uiimage_scimageborder|
                uiimage_scimageborder.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCImageBorder.{h,m}'
            end
            
            # UIImage+SCImageCompression
            uiimage.subspec 'UIImage+SCImageCompression' do |uiimage_scimagecompression|
                uiimage_scimagecompression.dependency 'SCCategories/UIKit/UIImage/UIImage+SCBase'
                uiimage_scimagecompression.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCImageCompression.{h,m}'
            end
            
            # UIImage+SCImageCropped
            uiimage.subspec 'UIImage+SCImageCropped' do |uiimage_scimagecropped|
                uiimage_scimagecropped.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCImageCropped.{h,m}'
            end
            
            # UIImage+SCImageFixed
            uiimage.subspec 'UIImage+SCImageFixed' do |uiimage_scimagefixed|
                uiimage_scimagefixed.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCImageFixed.{h,m}'
            end
            
            # UIImage+SCImageRotation
            uiimage.subspec 'UIImage+SCImageRotation' do |uiimage_scimagerotation|
                uiimage_scimagerotation.frameworks = 'Accelerate'
                uiimage_scimagerotation.dependency 'SCCategories/CoreGraphic'
                uiimage_scimagerotation.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCImageRotation.{h,m}'
            end
            
            # UIImage+SCRoundedImage
            uiimage.subspec 'UIImage+SCRoundedImage' do |uiimage_scroundedimage|
                uiimage_scroundedimage.dependency 'SCCategories/CoreGraphic'
                uiimage_scroundedimage.source_files = 'SCCategories/Classes/UIKit/UIImage/UIImage+SCRoundedImage.{h,m}'
            end
        end
        
        # UINavigationBar
        uikit.subspec 'UINavigationBar' do |uinavigationBar|
            uinavigationBar.source_files = 'SCCategories/Classes/UIKit/UINavigationBar/UINavigationBar+SCCategories.{h,m}'
            
            # UINavigationBar+SCBase
            uinavigationBar.subspec 'UINavigationBar+SCBase' do |uinavigationBar_scbase|
                uinavigationBar_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uinavigationBar_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCSwizzleMethod'
                uinavigationBar_scbase.source_files = 'SCCategories/Classes/UIKit/UINavigationBar/UINavigationBar+SCBase.{h,m}'
            end
        end
        
        # UINavigationController
        uikit.subspec 'UINavigationController' do |uinavigationController|
            uinavigationController.source_files = 'SCCategories/Classes/UIKit/UINavigationController/UINavigationController+SCCategories.{h,m}'
            
            # UINavigationController+SCBase
            uinavigationController.subspec 'UINavigationController+SCBase' do |uinavigationController_scbase|
                uinavigationController_scbase.source_files = 'SCCategories/Classes/UIKit/UINavigationController/UINavigationController+SCBase.{h,m}'
            end
        end
        
        # UIScreen
        uikit.subspec 'UIScreen' do |uiscreen|
            uiscreen.source_files = 'SCCategories/Classes/UIKit/UIScreen/UIScreen+SCCategories.{h,m}'
            
            # UIScreen+SCBase
            uiscreen.subspec 'UIScreen+SCBase' do |uiscreen_scbase|
                uiscreen_scbase.dependency 'SCCategories/UIKit/UIDevice/UIDevice+SCBase'
                uiscreen_scbase.source_files = 'SCCategories/Classes/UIKit/UIScreen/UIScreen+SCBase.{h,m}'
            end
        end
        
        # UIScrollView
        uikit.subspec 'UIScrollView' do |uiscrollview|
            uiscrollview.source_files = 'SCCategories/Classes/UIKit/UIScrollView/UIScrollView+SCCategories.{h,m}'
            
            # UIScrollView+SCBase
            uiscrollview.subspec 'UIScrollView+SCBase' do |uiscrollview_scbase|
                uiscrollview_scbase.dependency 'SCCategories/CoreGraphic'
                uiscrollview_scbase.source_files = 'SCCategories/Classes/UIKit/UIScrollView/UIScrollView+SCBase.{h,m}'
            end
        end
        
        # UISlider
        uikit.subspec 'UISlider' do |uislider|
            uislider.source_files = 'SCCategories/Classes/UIKit/UISlider/UISlider+SCCategories.{h,m}'
            
            # UISlider+SCBase
            uislider.subspec 'UISlider+SCBase' do |uislider_scbase|
                uislider_scbase.source_files = 'SCCategories/Classes/UIKit/UISlider/UISlider+SCBase.{h,m}'
            end
        end
        
        # UISwipeGestureRecognizer
        uikit.subspec 'UISwipeGestureRecognizer' do |uiswipegesturerecognizer|
            uiswipegesturerecognizer.source_files = 'SCCategories/Classes/UIKit/UISwipeGestureRecognizer/UISwipeGestureRecognizer+SCCategories.{h,m}'
            
            # UISwipeGestureRecognizer+SCBase
            uiswipegesturerecognizer.subspec 'UISwipeGestureRecognizer+SCBase' do |uiswipegesturerecognizer_scbase|
                uiswipegesturerecognizer_scbase.dependency 'SCCategories/UIKit/UIGestureRecognizer/UIGestureRecognizer+SCBase'
                uiswipegesturerecognizer_scbase.source_files = 'SCCategories/Classes/UIKit/UISwipeGestureRecognizer/UISwipeGestureRecognizer+SCBase.{h,m}'
            end
        end
        
        # UITabBar
        uikit.subspec 'UITabBar' do |uitabbar|
            uitabbar.source_files = 'SCCategories/Classes/UIKit/UITabBar/UITabBar+SCCategories.{h,m}'
            
            # UITabBar+SCBase
            uitabbar.subspec 'UITabBar+SCBase' do |uitabbar_scbase|
                uitabbar_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uitabbar_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCSwizzleMethod'
                uitabbar_scbase.source_files = 'SCCategories/Classes/UIKit/UITabBar/UITabBar+SCBase.{h,m}'
            end
        end
        
        # UITableView
        uikit.subspec 'UITableView' do |uitableview|
            uitableview.source_files = 'SCCategories/Classes/UIKit/UITableView/UITableView+SCCategories.{h,m}'
            
            # UITableView+SCBase
            uitableview.subspec 'UITableView+SCBase' do |uitableview_scbase|
                uitableview_scbase.dependency 'SCCategories/Foundation/NSArray/NSArray+SCSort'
                uitableview_scbase.source_files = 'SCCategories/Classes/UIKit/UITableView/UITableView+SCBase.{h,m}'
            end
        end
        
        # UITableViewCell
        uikit.subspec 'UITableViewCell' do |uitableviewcell|
            uitableviewcell.source_files = 'SCCategories/Classes/UIKit/UITableViewCell/UITableViewCell+SCCategories.{h,m}'
            
            # UITableViewCell+SCBase
            uitableviewcell.subspec 'UITableViewCell+SCBase' do |uitableviewcell_scbase|
                uitableviewcell_scbase.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uitableviewcell_scbase.source_files = 'SCCategories/Classes/UIKit/UITableViewCell/UITableViewCell+SCBase.{h,m}'
            end
        end
        
        # UITextField
        uikit.subspec 'UITextField' do |uitextfield|
            uitextfield.source_files = 'SCCategories/Classes/UIKit/UITextField/UITextField+SCCategories.{h,m}'
            
            # UITextField+SCBase
            uitextfield.subspec 'UITextField+SCBase' do |uitextfield_scbase|
                uitextfield_scbase.source_files = 'SCCategories/Classes/UIKit/UITextField/UITextField+SCBase.{h,m}'
            end
        end
        
        # UITextView
        uikit.subspec 'UITextView' do |uitextview|
            uitextview.source_files = 'SCCategories/Classes/UIKit/UITextView/UITextView+SCCategories.{h,m}'
            
            # UITextView+SCBase
            uitextview.subspec 'UITextView+SCBase' do |uitextview_scbase|
                uitextview_scbase.source_files = 'SCCategories/Classes/UIKit/UITextView/UITextView+SCBase.{h,m}'
            end
        end
        
        # UIView
        uikit.subspec 'UIView' do |uiview|
            uiview.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCCategories.{h,m}'
            
            # UIView+SCBase
            uiview.subspec 'UIView+SCBase' do |uiview_scbase|
                uiview_scbase.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCBase.{h,m}'
            end
            
            # UIView+SCCountDown
            uiview.subspec 'UIView+SCCountDown' do |uiview_sccountdown|
                uiview_sccountdown.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCCountDown.{h,m}'
            end
            
            # UIView+SCLayout
            uiview.subspec 'UIView+SCLayout' do |uiview_sclayout|
                uiview_sclayout.dependency 'SCCategories/UIKit/UIView/UIView+SCBase'
                uiview_sclayout.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCLayout.{h,m}'
            end
            
            # UIView+SCNibView
            uiview.subspec 'UIView+SCNibView' do |uiview_scnibview|
                uiview_scnibview.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCNibView.{h,m}'
            end
            
            # UIView+SCShadow
            uiview.subspec 'UIView+SCShadow' do |uiview_scshadow|
                uiview_scshadow.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCShadow.{h,m}'
            end
            
            # UIView+SCShakeAnimation
            uiview.subspec 'UIView+SCShakeAnimation' do |uiview_scshakeanimation|
                uiview_scshakeanimation.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCShakeAnimation.{h,m}'
            end
            
            # UIView+SCSnapshot
            uiview.subspec 'UIView+SCSnapshot' do |uiview_scsnapshot|
                uiview_scsnapshot.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCSnapshot.{h,m}'
            end
            
            # UIView+SCTouchInset
            uiview.subspec 'UIView+SCTouchInset' do |uiview_sctouchinset|
                uiview_sctouchinset.dependency 'SCCategories/Foundation/NSObject/NSObject+SCSwizzleMethod'
                uiview_sctouchinset.dependency 'SCCategories/Foundation/NSObject/NSObject+SCAssociatedValue'
                uiview_sctouchinset.source_files = 'SCCategories/Classes/UIKit/UIView/UIView+SCTouchInset.{h,m}'
            end
        end
        
        # UIViewController
        uikit.subspec 'UIViewController' do |uiviewController|
            uiviewController.source_files = 'SCCategories/Classes/UIKit/UIViewController/UIViewController+SCCategories.{h,m}'
            
            # UIViewController+SCBase
            uiviewController.subspec 'UIViewController+SCBase' do |uiviewcontroller_scbase|
                uiviewcontroller_scbase.source_files = 'SCCategories/Classes/UIKit/UIViewController/UIViewController+SCBase.{h,m}'
            end
        end
        
    end
    
    # QuartzCore
    s.subspec 'QuartzCore' do |quartzCore|
        
        # CALayer
        quartzCore.subspec 'CALayer' do |calayer|
            calayer.source_files = 'SCCategories/Classes/QuartzCore/CALayer/CALayer+SCCategories.{h,m}'
            
            # CALayer+SCBase
            calayer.subspec 'CALayer+SCBase' do |calayer_scbase|
                calayer_scbase.dependency 'SCCategories/CoreGraphic'
                calayer_scbase.source_files = 'SCCategories/Classes/QuartzCore/CALayer/CALayer+SCBase.{h,m}'
            end
            
            # CALayer+SCFadeAnimation
            calayer.subspec 'CALayer+SCFadeAnimation' do |calayer_scfadeanimation|
                calayer_scfadeanimation.frameworks = 'UIKit'
                calayer_scfadeanimation.source_files = 'SCCategories/Classes/QuartzCore/CALayer/CALayer+SCFadeAnimation.{h,m}'
            end
            
            # CALayer+SCLayout
            calayer.subspec 'CALayer+SCLayout' do |calayer_sclayout|
                calayer_sclayout.source_files = 'SCCategories/Classes/QuartzCore/CALayer/CALayer+SCLayout.{h,m}'
            end
            
            # CALayer+SCShadow
            calayer.subspec 'CALayer+SCShadow' do |calayer_scshadow|
                calayer_scshadow.frameworks = 'UIKit'
                calayer_scshadow.source_files = 'SCCategories/Classes/QuartzCore/CALayer/CALayer+SCShadow.{h,m}'
            end
            
            # CALayer+SCSnapshot
            calayer.subspec 'CALayer+SCSnapshot' do |calayer_scsnapshot|
                calayer_scsnapshot.frameworks = 'UIKit'
                calayer_scsnapshot.source_files = 'SCCategories/Classes/QuartzCore/CALayer/CALayer+SCSnapshot.{h,m}'
            end
            
            # CALayer+SCTransform
            calayer.subspec 'CALayer+SCTransform' do |calayer_sctransform|
                calayer_sctransform.source_files = 'SCCategories/Classes/QuartzCore/CALayer/CALayer+SCTransform.{h,m}'
            end
        end
    end
    
    # CoreGraphic
    s.subspec 'CoreGraphic' do |coregraphic|
        coregraphic.source_files = 'SCCategories/Classes/CoreGraphic/*.{h,m}'
    end
    
    # SCMacro
    s.subspec 'Macro' do |macro|
        macro.source_files = 'SCCategories/Classes/Macro/*.{h,m}'
    end
    
end
