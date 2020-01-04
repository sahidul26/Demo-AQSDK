//
//  SocketModel.swift
//  Acquire-sdk
//
//  Created by Akash Soni on 26/11/19.
//  Copyright © 2019 Acquire. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let socketDetailsModel = try? newJSONDecoder().decode(SocketDetailsModel.self, from: jsonData)

import Foundation

// MARK: - SocketDetailsModel
struct SocketDetailsModel: Codable {
    let track: Track?
    let account: Account?
    let myself: Myself?
    
    /// use this method to store visitHash and Visitor hash into userdefaults.
    func storeHashDetailsInUserDefaults(){
        if let visitHash = self.track?.visitHash {
            UserDefaults.standard.setValue(visitHash, forKey: AQConstants.UserDefault.visitHash)
        }
        if let visitorHash = self.track?.visitorHash {
            UserDefaults.standard.setValue(visitorHash, forKey: AQConstants.UserDefault.visitorHash)
        }
    }
    
}

// MARK: - Account
struct Account: Codable {
    let triggers: Triggers?
    let agents: [Agent]?
    let parentEnterpriseAccUid: JSONNull?
    let tags: [String: String]?
    let webhookManualSync: Bool?
    let googleIntegration: GoogleIntegration?
    let lastName, name: String?
    let planID: Int?
    let translatedMessage: TranslatedMessage?
    let settings: Settings?
    let id, lastModified: Int?
    let departments: [String: String]?
    let uid: String?
    let metaField: MetaField?
    let parentAccID: JSONNull?
    let chatbot: [String: Chatbot]?
    let sellerid, firstName: String?
    let limits: Limits?

    enum CodingKeys: String, CodingKey {
        case triggers, agents
        case parentEnterpriseAccUid = "parent_enterprise_acc_uid"
        case tags
        case webhookManualSync = "webhook_manual_sync"
        case googleIntegration = "google_integration"
        case lastName = "last_name"
        case name
        case planID = "plan_id"
        case translatedMessage = "translated_message"
        case settings, id
        case lastModified = "last_modified"
        case departments, uid
        case metaField = "meta_field"
        case parentAccID = "parent_acc_id"
        case chatbot, sellerid
        case firstName = "first_name"
        case limits
    }
}

// MARK: - Agent
struct Agent: Codable {
    let status: String?
    let id: Int?
    let metaField: String?
    let lastName: String?
    let pushNotifications: JSONNull?
    let photo: String?
    let departmentName: String?
    let departments: [Int]?
    let firstName: String?

    enum CodingKeys: String, CodingKey {
        case status, id
        case metaField = "meta_field"
        case lastName = "last_name"
        case pushNotifications = "push_notifications"
        case photo
        case departmentName = "department_name"
        case departments
        case firstName = "first_name"
    }
}

// MARK: - Chatbot
struct Chatbot: Codable {
    let id: Int?
    let skipSSL, pParams: String?
    let parentID: Int?
    let url: String?
    let mergedParams, cParams, title, wantSuggestion: String?
    let icon, visible: String?
    let accountID: Int?
    let name, status: String?

    enum CodingKeys: String, CodingKey {
        case id
        case skipSSL = "skip_ssl"
        case pParams = "p_params"
        case parentID = "parent_id"
        case url
        case mergedParams = "merged_params"
        case cParams = "c_params"
        case title
        case wantSuggestion = "want_suggestion"
        case icon, visible
        case accountID = "account_id"
        case name, status
    }
}

// MARK: - GoogleIntegration
struct GoogleIntegration: Codable {
    let googleAnalytics: JSONNull?

    enum CodingKeys: String, CodingKey {
        case googleAnalytics = "google_analytics"
    }
}

// MARK: - Limits
struct Limits: Codable {
    let visitorList, analyticProfile, webhook: String?
    let chatWidgetWhitelabel: Int?
    let numberOfAgents, maxAgents, knowledgeBase: String?
    let coBrowseIdentify: Int?
    let chatNote: String?
    let auditLog: Int?
    let audioVideoCalls, integrationMobileApps, integrationMicrosoftDynamicCRM, integrationSpellingCheckLibrary: String?
    let integrationInfusionsoft, liveMonitor, coBrowseWithChat, numberOfCampaigns: String?
    let minAgents, chatShortcut, integrationGoogleTagManager, integration: String?
    let chatTag, liveChat, integrationZoho, screenShare: String?
    let chatbotAccess, apiAccess, numberOfDepartment, salesBot: String?
    let analyticChatbot, integrationFreshservices, chatTranslate, multipleAgentLevelPermission: String?
    let sso, customCSSForChatWidget, frontendChatWidgetApps, integrationZapier: String?
    let chatRouting, analyticGeneral, trackUser, quickLink: String?
    let integrationFacebookMessenger, singleTenet, integrationHubspot: String?
    let integrationSalesforceAppExchange: Int?
    let integrationSugarCRM, integrationSalesforce, smartSuggetion, operatingHours: String?
    let integrationZendeskMarketplace: Int?
    let coBrowsing, numberOfConversion, customFeedback, voipAccess: String?
    let profiles, fileSharingSetting, feedbackOnDepartment, bannedVisitor: String?
    let integrationTalkdesk, analyticOtherAdvance: Int?
    let integrationGoogleAnalytics: String?
    let profileAccessLevel: Int?
    let cobrowseVideoRecording, mobileSDKPushNotification: String?
    let coBrowseLive: Int?
    let chatConversion, integrationDesktopSoftware, integrationSlack, chatTransfer: String?
    let supportBot, inAppCampign: String?
    let accountSwitching: Int?
    let customFeedbackReporting, analyticAgent, emailPiping, sdk: String?
    let emailCompaign, domainWhitelist, integrationZendesk, coBrowseWithCode: String?

    enum CodingKeys: String, CodingKey {
        case visitorList = "visitor_list"
        case analyticProfile = "analytic_profile"
        case webhook
        case chatWidgetWhitelabel = "chat_widget_whitelabel"
        case numberOfAgents = "number_of_agents"
        case maxAgents = "max_agents"
        case knowledgeBase = "knowledge_base"
        case coBrowseIdentify = "co_browse_identify"
        case chatNote = "chat_note"
        case auditLog = "audit_log"
        case audioVideoCalls = "audio_video_calls"
        case integrationMobileApps = "integration_mobile_apps"
        case integrationMicrosoftDynamicCRM = "integration_microsoft_dynamic_crm"
        case integrationSpellingCheckLibrary = "integration_spelling_check_library"
        case integrationInfusionsoft = "integration_infusionsoft"
        case liveMonitor = "live_monitor"
        case coBrowseWithChat = "co_browse_with_chat"
        case numberOfCampaigns = "number_of_campaigns"
        case minAgents = "min_agents"
        case chatShortcut = "chat_shortcut"
        case integrationGoogleTagManager = "integration_google_tag_manager"
        case integration
        case chatTag = "chat_tag"
        case liveChat = "live_chat"
        case integrationZoho = "integration_zoho"
        case screenShare = "screen_share"
        case chatbotAccess = "chatbot_access"
        case apiAccess = "api_access"
        case numberOfDepartment = "number_of_department"
        case salesBot = "sales_bot"
        case analyticChatbot = "analytic_chatbot"
        case integrationFreshservices = "integration_freshservices"
        case chatTranslate = "chat_translate"
        case multipleAgentLevelPermission = "multiple_agent_level_permission"
        case sso
        case customCSSForChatWidget = "custom_css_for_chat_widget"
        case frontendChatWidgetApps = "frontend_chat_widget_apps"
        case integrationZapier = "integration_zapier"
        case chatRouting = "chat_routing"
        case analyticGeneral = "analytic_general"
        case trackUser = "track_user"
        case quickLink = "quick_link"
        case integrationFacebookMessenger = "integration_facebook_messenger"
        case singleTenet = "single_tenet"
        case integrationHubspot = "integration_hubspot"
        case integrationSalesforceAppExchange = "integration_salesforce_app_exchange"
        case integrationSugarCRM = "integration_sugar_crm"
        case integrationSalesforce = "integration_salesforce"
        case smartSuggetion = "smart_suggetion"
        case operatingHours = "operating_hours"
        case integrationZendeskMarketplace = "integration_zendesk_marketplace"
        case coBrowsing = "co_browsing"
        case numberOfConversion = "number_of_conversion"
        case customFeedback = "custom_feedback"
        case voipAccess = "voip_access"
        case profiles
        case fileSharingSetting = "file_sharing_setting"
        case feedbackOnDepartment = "feedback_on_department"
        case bannedVisitor = "banned_visitor"
        case integrationTalkdesk = "integration_talkdesk"
        case analyticOtherAdvance = "analytic_other_advance"
        case integrationGoogleAnalytics = "integration_google_analytics"
        case profileAccessLevel = "profile_access_level"
        case cobrowseVideoRecording = "cobrowse_video_recording"
        case mobileSDKPushNotification = "mobile_sdk_push_notification"
        case coBrowseLive = "co_browse_live"
        case chatConversion = "chat_conversion"
        case integrationDesktopSoftware = "integration_desktop_software"
        case integrationSlack = "integration_slack"
        case chatTransfer = "chat_transfer"
        case supportBot = "support_bot"
        case inAppCampign = "in_app_campign"
        case accountSwitching = "account_switching"
        case customFeedbackReporting = "custom_feedback_reporting"
        case analyticAgent = "analytic_agent"
        case emailPiping = "email_piping"
        case sdk
        case emailCompaign = "email_compaign"
        case domainWhitelist = "domain_whitelist"
        case integrationZendesk = "integration_zendesk"
        case coBrowseWithCode = "co_browse_with_code"
    }
}

// MARK: - MetaField
struct MetaField: Codable {
    let companyName, nextStep, userFor, basicPlanPopop: JSONNull?
    let signupPlan, clientSource, clientDestination: JSONNull?

    enum CodingKeys: String, CodingKey {
        case companyName = "company_name"
        case nextStep = "next_step"
        case userFor = "user_for"
        case basicPlanPopop = "basic_plan_popop"
        case signupPlan = "signup_plan"
        case clientSource = "client_source"
        case clientDestination = "client_destination"
    }
}

// MARK: - Settings
struct Settings: Codable {
    let cobrowseWidgetHeading, onlinePhoneText, offlineMessageText, inputAreaPlaceholder0: String?
    let showHomeAgentAvatars, offlineChatMailTranscriptVisibility, hdClient, videoRecording: String?
    let auditLog, customChatButtonImg, companyName: String?
    let specialHolidays: JSONNull?
    let communicationEnable, formSettings, showViewChatButton, timezone: String?
    let widgetTheme, onlineDepartmentText, supbotPageRedirectEvent, pleaseWait: String?
    let disableHelpChatWidget, agentNewChatSoundRepeat, issueReasonName, chatFeedbackThanks: String?
    let supbotSuggestionBubble: String?
    let allowEventTrack: JSONNull?
    let cobrowseRequestTitle, workingHoursToggle: String?
    let secondaryColor: JSONNull?
    let screenShareRequestAlert, highLoadDashboard, cobrowseRequestAlert, chatStartMessage: String?
    let offlineDataCollectDelay, supbotTitleOnButton, coBrowsingDisableTextField, widgetDarkTheme: String?
    let offlinePhoneText, offlineMessage, chatSessionMode: String?
    let clientLogTrack: JSONNull?
    let chatCloseTagsRequired, launcherVibration, widgetPosition, supbotDefaultAnswer: String?
    let offlineButtonColor, companyLogoMetaData: JSONNull?
    let autoMinimizeChatMediaCalls, chatShortcutKey, offlineNameText, supbotQuickCurrentStatus: String?
    let screenShareResponseDeclined: String?
    let modernBtnBackgroundColor, textColor, backendWhitelistDomains: JSONNull?
    let supbotQuickCurrentBotID, disableCanvasSupport, privacyLinkText, offlineEmailText: String?
    let cobrowseDisabledView, disableFileUploadFrontend, tooltipTextButton, autoStartSlientCobrowse: String?
    let supbotFeedbackDownSuggestion: String?
    let anotherColor: JSONNull?
    let widgetBottomSpacing, primaryColor, transcriptSenderMail, drawingMode: String?
    let feedbackType, recordCallsTNC, queueThreshold, preventServerSideCobrowsing: String?
    let showVisitorStartCobrowseButton, chatFeedbackText, integrationAutosuggestionEnable, languageBackend: String?
    let silentCobrowseButton, showAllAgentOnInit, disableDynamicCSSSupport, supbotCommontalkToggle: String?
    let disableSVGSupport: String?
    let privacyLinkURL, backgroundColor: JSONNull?
    let iframeLoadClient, offlineAgents, agentNewChatSound, chatFeedbackCloseAlert: String?
    let workingSchedule: JSONNull?
    let cobrowseResponseDeclined, whiteLabelCustomization, companyLogo, tooltipAudioButton: String?
    let agentNewMsgNotification, agentNewChatNotification, cobrowseCSS, integrationAutosuggestionValue: String?
    let showOnlyCustomPlan: JSONNull?
    let supbotAlwaysTransferChat, howSupportText, chatWaitNotifiedTitle, onlineNameText: String?
    let feedbackQuestions: [JSONAny]?
    let clearbitStatus, showVideoCallButton, chatFormText, hideButton: String?
    let supbotChatTransferEvent, securityFilesPermissions: String?
    let quickLinks: JSONNull?
    let tooltipVideoButton, operatorReplyTimeText, cobrowseDisabledInputField, onlineMessage: String?
    let cobrowseServerErrorMessage, onlineEmailText, chatMessagesLanguage, triggerInviteHeading: String?
    let language, widgetSideSpacing: String?
    let frontendWhitelistDomains: JSONNull?
    let disableFileUpload: String?
    let cobrowseDomains: JSONNull?
    let offlineWidgetHeading, agentRoundTime, selfDevelopedTheme: String?
    let showVisitorIPMask: JSONNull?
    let offlineVisitorMailBody, cobrowseRecordSession, cobrowseDisableIframes, disableCSSBasedHoverEventsSupport: String?
    let deleteChatOnClose, supbotFeedbackFlag, customCSS, timezoneOffset: String?
    let profileAccessLevel: JSONNull?
    let showStartChatButton, cobrowseAskPermission, inputAreaPlaceholder1, customThemeButton: String?
    let excludeAgentsFromRecording, disablePoweredBy: String?
    let coBrowsingWhitelistDomains: JSONNull?
    let simpleDashboardUI, askToVisitorTitle, autoRecord, onlineMessageText: String?
    let homeCardIDS: JSONNull?
    let forceSingleThread, assignAgentChat, nestedFrame, privacyLinkMode: String?
    let requestRecordingFiles: JSONNull?
    let onlineChatEventMessage, chatWindow, offlineThankyou: String?
    let requestChatCSVFiles: JSONNull?
    let pleaseWaitCounter, disableVisitorSearchBox, maxChatPerAgent, howSupportIs: String?
    let supbotFrontSuggestionBubble, hideCobrowseWidgetAfterChatClosed, enableBillingCycleChange, supbotResponseOnShortMsg: String?
    let chatFeedbackTextHeading, cobrowseOnly, cobrowseShowURLBar, supbotFeedbackDownTransfer: String?
    let webSpellChecker, cobrowseDisableProxy, offlineVisitorMailVisibility, showAudioCallButton: String?
    let cobrowseInst, startConversation: String?
    let emailPiping: JSONNull?
    let cobrowseShowDrawingControlsToVisitor, newsletterTracker, appDataRequestFlowTimeout, windowSize: String?
    let supbotNoreplyAutopushSuggestion, supbotDefaultLangFilter, disableUrlbarAgent, timezoneOffsetDecimal: String?
    let agentNewMsgSound, chatFormHeading, cobrowseForceDrawing, chatFeedbackHeading: String?
    let offlineChatEventMessage, agentDefaultCallPickType: String?

    enum CodingKeys: String, CodingKey {
        case cobrowseWidgetHeading = "cobrowse_widget_heading"
        case onlinePhoneText = "online_phone_text"
        case offlineMessageText = "offline_message_text"
        case inputAreaPlaceholder0 = "input_area_placeholder_0"
        case showHomeAgentAvatars = "show_home_agent_avatars"
        case offlineChatMailTranscriptVisibility = "offline_chat_mail_transcript_visibility"
        case hdClient
        case videoRecording = "video_recording"
        case auditLog = "audit_log"
        case customChatButtonImg = "custom_chat_button_img"
        case companyName = "company_name"
        case specialHolidays = "special_holidays"
        case communicationEnable = "communication_enable"
        case formSettings = "form_settings"
        case showViewChatButton = "show_view_chat_button"
        case timezone
        case widgetTheme = "widget_theme"
        case onlineDepartmentText = "online_department_text"
        case supbotPageRedirectEvent = "supbot_page_redirect_event"
        case pleaseWait = "please_wait"
        case disableHelpChatWidget = "disable_help_chat_widget"
        case agentNewChatSoundRepeat = "agent_new_chat_sound_repeat"
        case issueReasonName = "issue_reason_name"
        case chatFeedbackThanks = "chat_feedback_thanks"
        case supbotSuggestionBubble = "supbot_suggestion_bubble"
        case allowEventTrack = "allow_event_track"
        case cobrowseRequestTitle = "cobrowse_request_title"
        case workingHoursToggle = "working_hours_toggle"
        case secondaryColor = "secondary_color"
        case screenShareRequestAlert = "screen_share_request_alert"
        case highLoadDashboard = "high_load_dashboard"
        case cobrowseRequestAlert = "cobrowse_request_alert"
        case chatStartMessage = "chat_start_message"
        case offlineDataCollectDelay = "offline_data_collect_delay"
        case supbotTitleOnButton = "supbot_title_on_button"
        case coBrowsingDisableTextField = "co_browsing_disable_text_field"
        case widgetDarkTheme = "widget_dark_theme"
        case offlinePhoneText = "offline_phone_text"
        case offlineMessage = "offline_message"
        case chatSessionMode = "chat_session_mode"
        case clientLogTrack = "client_log_track"
        case chatCloseTagsRequired = "chat_close_tags_required"
        case launcherVibration = "launcher_vibration"
        case widgetPosition = "widget_position"
        case supbotDefaultAnswer = "supbot_default_answer"
        case offlineButtonColor = "offline_button_color"
        case companyLogoMetaData = "company_logo_meta_data"
        case autoMinimizeChatMediaCalls = "auto_minimize_chat_media_calls"
        case chatShortcutKey = "chat_shortcut_key"
        case offlineNameText = "offline_name_text"
        case supbotQuickCurrentStatus = "supbot_quick_current_status"
        case screenShareResponseDeclined = "screen_share_response_declined"
        case modernBtnBackgroundColor = "modern_btn_background_color"
        case textColor = "text_color"
        case backendWhitelistDomains = "backend_whitelist_domains"
        case supbotQuickCurrentBotID = "supbot_quick_current_bot_id"
        case disableCanvasSupport = "disable_canvas_support"
        case privacyLinkText = "privacy_link_text"
        case offlineEmailText = "offline_email_text"
        case cobrowseDisabledView = "cobrowse_disabled_view"
        case disableFileUploadFrontend = "disable_file_upload_frontend"
        case tooltipTextButton = "tooltip_text_button"
        case autoStartSlientCobrowse = "auto_start_slient_cobrowse"
        case supbotFeedbackDownSuggestion = "supbot_feedback_down_suggestion"
        case anotherColor = "another_color"
        case widgetBottomSpacing = "widget_bottom_spacing"
        case primaryColor = "primary_color"
        case transcriptSenderMail = "transcript_sender_mail"
        case drawingMode
        case feedbackType = "feedback_type"
        case recordCallsTNC = "record_calls_tnc"
        case queueThreshold = "queue_threshold"
        case preventServerSideCobrowsing = "prevent_server_side_cobrowsing"
        case showVisitorStartCobrowseButton = "show_visitor_start_cobrowse_button"
        case chatFeedbackText = "chat_feedback_text"
        case integrationAutosuggestionEnable = "integration_autosuggestion_enable"
        case languageBackend = "language_backend"
        case silentCobrowseButton = "silent_cobrowse_button"
        case showAllAgentOnInit = "show_all_agent_on_init"
        case disableDynamicCSSSupport = "disable_dynamic_css_support"
        case supbotCommontalkToggle = "supbot_commontalk_toggle"
        case disableSVGSupport = "disable_svg_support"
        case privacyLinkURL = "privacy_link_url"
        case backgroundColor = "background_color"
        case iframeLoadClient
        case offlineAgents = "offline_agents"
        case agentNewChatSound = "agent_new_chat_sound"
        case chatFeedbackCloseAlert = "chat_feedback_close_alert"
        case workingSchedule = "working_schedule"
        case cobrowseResponseDeclined = "cobrowse_response_declined"
        case whiteLabelCustomization = "white_label_customization"
        case companyLogo = "company_logo"
        case tooltipAudioButton = "tooltip_audio_button"
        case agentNewMsgNotification = "agent_new_msg_notification"
        case agentNewChatNotification = "agent_new_chat_notification"
        case cobrowseCSS = "cobrowse_css"
        case integrationAutosuggestionValue = "integration_autosuggestion_value"
        case showOnlyCustomPlan = "show_only_custom_plan"
        case supbotAlwaysTransferChat = "supbot_always_transfer_chat"
        case howSupportText = "how_support_text"
        case chatWaitNotifiedTitle = "chat_wait_notified_title"
        case onlineNameText = "online_name_text"
        case feedbackQuestions = "feedback_questions"
        case clearbitStatus = "clearbit_status"
        case showVideoCallButton = "show_video_call_button"
        case chatFormText = "chat_form_text"
        case hideButton = "hide_button"
        case supbotChatTransferEvent = "supbot_chat_transfer_event"
        case securityFilesPermissions = "security_files_permissions"
        case quickLinks = "quick_links"
        case tooltipVideoButton = "tooltip_video_button"
        case operatorReplyTimeText = "operator_reply_time_text"
        case cobrowseDisabledInputField = "cobrowse_disabled_input_field"
        case onlineMessage = "online_message"
        case cobrowseServerErrorMessage = "cobrowse_server_error_message"
        case onlineEmailText = "online_email_text"
        case chatMessagesLanguage = "chat_messages_language"
        case triggerInviteHeading = "trigger_invite_heading"
        case language
        case widgetSideSpacing = "widget_side_spacing"
        case frontendWhitelistDomains = "frontend_whitelist_domains"
        case disableFileUpload = "disable_file_upload"
        case cobrowseDomains = "cobrowse_domains"
        case offlineWidgetHeading = "offline_widget_heading"
        case agentRoundTime = "agent_round_time"
        case selfDevelopedTheme = "self_developed_theme"
        case showVisitorIPMask = "show_visitor_ip_mask"
        case offlineVisitorMailBody = "offline_visitor_mail_body"
        case cobrowseRecordSession = "cobrowse_record_session"
        case cobrowseDisableIframes = "cobrowse_disable_iframes"
        case disableCSSBasedHoverEventsSupport = "disable_css_based_hover_events_support"
        case deleteChatOnClose = "delete_chat_on_close"
        case supbotFeedbackFlag = "supbot_feedback_flag"
        case customCSS = "custom_css"
        case timezoneOffset = "timezone_offset"
        case profileAccessLevel = "profile_access_level"
        case showStartChatButton = "show_start_chat_button"
        case cobrowseAskPermission = "cobrowse_ask_permission"
        case inputAreaPlaceholder1 = "input_area_placeholder_1"
        case customThemeButton = "custom_theme_button"
        case excludeAgentsFromRecording = "exclude_agents_from_recording"
        case disablePoweredBy = "disable_powered_by"
        case coBrowsingWhitelistDomains = "co_browsing_whitelist_domains"
        case simpleDashboardUI = "simple_dashboard_ui"
        case askToVisitorTitle = "ask_to_visitor_title"
        case autoRecord = "auto_record"
        case onlineMessageText = "online_message_text"
        case homeCardIDS = "home_card_ids"
        case forceSingleThread = "force_single_thread"
        case assignAgentChat = "assign_agent_chat"
        case nestedFrame
        case privacyLinkMode = "privacy_link_mode"
        case requestRecordingFiles = "request_recording_files"
        case onlineChatEventMessage = "online_chat_event_message"
        case chatWindow = "chat_window"
        case offlineThankyou = "offline_thankyou"
        case requestChatCSVFiles = "request_chat_csv_files"
        case pleaseWaitCounter = "please_wait_counter"
        case disableVisitorSearchBox = "disable_visitor_search_box"
        case maxChatPerAgent = "max_chat_per_agent"
        case howSupportIs = "how_support_is"
        case supbotFrontSuggestionBubble = "supbot_front_suggestion_bubble"
        case hideCobrowseWidgetAfterChatClosed = "hide_cobrowse_widget_after_chat_closed"
        case enableBillingCycleChange = "enable_billing_cycle_change"
        case supbotResponseOnShortMsg = "supbot_response_on_short_msg"
        case chatFeedbackTextHeading = "chat_feedback_text_heading"
        case cobrowseOnly = "cobrowse_only"
        case cobrowseShowURLBar = "cobrowse_show_url_bar"
        case supbotFeedbackDownTransfer = "supbot_feedback_down_transfer"
        case webSpellChecker = "web_spell_checker"
        case cobrowseDisableProxy = "cobrowse_disable_proxy"
        case offlineVisitorMailVisibility = "offline_visitor_mail_visibility"
        case showAudioCallButton = "show_audio_call_button"
        case cobrowseInst = "cobrowse_inst"
        case startConversation = "start_conversation"
        case emailPiping = "email_piping"
        case cobrowseShowDrawingControlsToVisitor = "cobrowse_show_drawing_controls_to_visitor"
        case newsletterTracker = "newsletter_tracker"
        case appDataRequestFlowTimeout = "app_data_request_flow_timeout"
        case windowSize = "window_size"
        case supbotNoreplyAutopushSuggestion = "supbot_noreply_autopush_suggestion"
        case supbotDefaultLangFilter = "supbot_default_lang_filter"
        case disableUrlbarAgent = "disable_urlbar_agent"
        case timezoneOffsetDecimal = "timezone_offset_decimal"
        case agentNewMsgSound = "agent_new_msg_sound"
        case chatFormHeading = "chat_form_heading"
        case cobrowseForceDrawing = "cobrowse_force_drawing"
        case chatFeedbackHeading = "chat_feedback_heading"
        case offlineChatEventMessage = "offline_chat_event_message"
        case agentDefaultCallPickType = "agent_default_call_pick_type"
    }
}

// MARK: - TranslatedMessage
struct TranslatedMessage: Codable {
    let node: [String: String]?
}

// MARK: - Triggers
struct Triggers: Codable {
}

// MARK: - Myself
struct Myself: Codable {
    let id: Double?
    let details: Details?
    let type, cobrowseCode: String?
    let client: Client?

    enum CodingKeys: String, CodingKey {
        case id, details, type
        case cobrowseCode = "cobrowse_code"
        case client
    }
}

// MARK: - Client
struct Client: Codable {
    let id, key, nick: String?
}

// MARK: - Details
struct Details: Codable {
    let name, email, phone: String?
}

// MARK: - Track
struct Track: Codable {
    let visitHash, visitorHash: String?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
class FormSettingsModel: Codable {
    let afterChatNotificationVisible: String?
    let chatWaitTime, offlineDataCollectDelay: Int?
    let askToVisitorTitle, chatWaitNotifiedTitle, onlineFormCustomFields, offlineFormCustomFields: String?
    let onlineFieldsVisiblility, offlineFieldsVisiblility, enableLeaveMsg: String?
    let offlineFormBeforeChat: Int?
    let onlineName, onlineNameReq, onlineEmail, onlineEmailReq: String?
    let onlineMessage, onlineMessageReq, onlinePhone, onlinePhoneReq: String?
    let onlineDepartment, onlineDepartmentReq, offlineName, offlineNameReq: String?
    let offlineEmail, offlinePhone, offlinePhoneReq, onlineNameText: String?
    let offlineNameText, onlineEmailText, offlineEmailText, onlineMessageText: String?
    let offlineMessage, offlineMessageReq, offlineMessageText, onlinePhoneText: String?
    let offlinePhoneText, onlineDepartmentText, offlineDepartment, offlineDepartmentReq: String?
    let offlineDepartmentText: String?

    enum CodingKeys: String, CodingKey {
        case afterChatNotificationVisible = "after_chat_notification_visible"
        case chatWaitTime = "chat_wait_time"
        case offlineDataCollectDelay = "offline_data_collect_delay"
        case askToVisitorTitle = "ask_to_visitor_title"
        case chatWaitNotifiedTitle = "chat_wait_notified_title"
        case onlineFormCustomFields = "online_form_custom_fields"
        case offlineFormCustomFields = "offline_form_custom_fields"
        case onlineFieldsVisiblility = "online_fields_visiblility"
        case offlineFieldsVisiblility = "offline_fields_visiblility"
        case enableLeaveMsg = "enable_leave_msg"
        case offlineFormBeforeChat = "offline_form_before_chat"
        case onlineName = "online_name"
        case onlineNameReq = "online_name_req"
        case onlineEmail = "online_email"
        case onlineEmailReq = "online_email_req"
        case onlineMessage = "online_message"
        case onlineMessageReq = "online_message_req"
        case onlinePhone = "online_phone"
        case onlinePhoneReq = "online_phone_req"
        case onlineDepartment = "online_department"
        case onlineDepartmentReq = "online_department_req"
        case offlineName = "offline_name"
        case offlineNameReq = "offline_name_req"
        case offlineEmail = "offline_email"
        case offlinePhone = "offline_phone"
        case offlinePhoneReq = "offline_phone_req"
        case onlineNameText = "online_name_text"
        case offlineNameText = "offline_name_text"
        case onlineEmailText = "online_email_text"
        case offlineEmailText = "offline_email_text"
        case onlineMessageText = "online_message_text"
        case offlineMessage = "offline_message"
        case offlineMessageReq = "offline_message_req"
        case offlineMessageText = "offline_message_text"
        case onlinePhoneText = "online_phone_text"
        case offlinePhoneText = "offline_phone_text"
        case onlineDepartmentText = "online_department_text"
        case offlineDepartment = "offline_department"
        case offlineDepartmentReq = "offline_department_req"
        case offlineDepartmentText = "offline_department_text"
    }

    init(afterChatNotificationVisible: String?, chatWaitTime: Int?, offlineDataCollectDelay: Int?, askToVisitorTitle: String?, chatWaitNotifiedTitle: String?, onlineFormCustomFields: String?, offlineFormCustomFields: String?, onlineFieldsVisiblility: String?, offlineFieldsVisiblility: String?, enableLeaveMsg: String?, offlineFormBeforeChat: Int?, onlineName: String?, onlineNameReq: String?, onlineEmail: String?, onlineEmailReq: String?, onlineMessage: String?, onlineMessageReq: String?, onlinePhone: String?, onlinePhoneReq: String?, onlineDepartment: String?, onlineDepartmentReq: String?, offlineName: String?, offlineNameReq: String?, offlineEmail: String?, offlinePhone: String?, offlinePhoneReq: String?, onlineNameText: String?, offlineNameText: String?, onlineEmailText: String?, offlineEmailText: String?, onlineMessageText: String?, offlineMessage: String?, offlineMessageReq: String?, offlineMessageText: String?, onlinePhoneText: String?, offlinePhoneText: String?, onlineDepartmentText: String?, offlineDepartment: String?, offlineDepartmentReq: String?, offlineDepartmentText: String?) {
        self.afterChatNotificationVisible = afterChatNotificationVisible
        self.chatWaitTime = chatWaitTime
        self.offlineDataCollectDelay = offlineDataCollectDelay
        self.askToVisitorTitle = askToVisitorTitle
        self.chatWaitNotifiedTitle = chatWaitNotifiedTitle
        self.onlineFormCustomFields = onlineFormCustomFields
        self.offlineFormCustomFields = offlineFormCustomFields
        self.onlineFieldsVisiblility = onlineFieldsVisiblility
        self.offlineFieldsVisiblility = offlineFieldsVisiblility
        self.enableLeaveMsg = enableLeaveMsg
        self.offlineFormBeforeChat = offlineFormBeforeChat
        self.onlineName = onlineName
        self.onlineNameReq = onlineNameReq
        self.onlineEmail = onlineEmail
        self.onlineEmailReq = onlineEmailReq
        self.onlineMessage = onlineMessage
        self.onlineMessageReq = onlineMessageReq
        self.onlinePhone = onlinePhone
        self.onlinePhoneReq = onlinePhoneReq
        self.onlineDepartment = onlineDepartment
        self.onlineDepartmentReq = onlineDepartmentReq
        self.offlineName = offlineName
        self.offlineNameReq = offlineNameReq
        self.offlineEmail = offlineEmail
        self.offlinePhone = offlinePhone
        self.offlinePhoneReq = offlinePhoneReq
        self.onlineNameText = onlineNameText
        self.offlineNameText = offlineNameText
        self.onlineEmailText = onlineEmailText
        self.offlineEmailText = offlineEmailText
        self.onlineMessageText = onlineMessageText
        self.offlineMessage = offlineMessage
        self.offlineMessageReq = offlineMessageReq
        self.offlineMessageText = offlineMessageText
        self.onlinePhoneText = onlinePhoneText
        self.offlinePhoneText = offlinePhoneText
        self.onlineDepartmentText = onlineDepartmentText
        self.offlineDepartment = offlineDepartment
        self.offlineDepartmentReq = offlineDepartmentReq
        self.offlineDepartmentText = offlineDepartmentText
    }
}
public class CustomFormFieldsModel {
    public var customFormFields : Array<CustomFormFields>?
    public class func modelsFromDictionaryArray(array:NSArray) -> [CustomFormFieldsModel]
    {
        var models:[CustomFormFieldsModel] = []
        for item in array
        {
            models.append(CustomFormFieldsModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    required public init?(dictionary: NSDictionary) {

        if (dictionary["customFormFields"] != nil) { customFormFields = CustomFormFields.modelsFromDictionaryArray(array: dictionary["customFormFields"] as? NSArray ?? NSArray()) }
    }
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()


        return dictionary
    }

}

public class AllValueModel {
    public var selected : Bool?
    public var label : String?
    public var value : String?

    public class func modelsFromDictionaryArray(array:NSArray) -> [AllValueModel]
    {
        var models:[AllValueModel] = []
        for item in array
        {
            models.append(AllValueModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    required public init?(dictionary: NSDictionary) {

        selected = dictionary["selected"] as? Bool
        label = dictionary["label"] as? String
        value = dictionary["value"] as? String
    }
    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.selected, forKey: "selected")
        dictionary.setValue(self.label, forKey: "label")
        dictionary.setValue(self.value, forKey: "value")

        return dictionary
    }

}
public class CustomFormFields {
    public var label : String?
    public var type : String?
    public var visible : Bool?
    public var in_visible : String?
    public var name : String?
    public var value : String?
    public var required : Bool?
    public var allValues : Array<AllValueModel>?

    public class func modelsFromDictionaryArray(array:NSArray) -> [CustomFormFields]
    {
        var models:[CustomFormFields] = []
        for item in array
        {
            models.append(CustomFormFields(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {

        label = dictionary["label"] as? String
        type = dictionary["type"] as? String
        visible = dictionary["visible"] as? Bool
        in_visible = dictionary["in_visible"] as? String
        name = dictionary["name"] as? String
        value = dictionary["value"] as? String
        required = dictionary["required"] as? Bool
        if (dictionary["values"] != nil) { allValues = AllValueModel.modelsFromDictionaryArray(array: dictionary["values"] as? NSArray ?? NSArray()) }
    }

    public func dictionaryRepresentation() -> NSDictionary {

        let dictionary = NSMutableDictionary()

        dictionary.setValue(self.label, forKey: "label")
        dictionary.setValue(self.type, forKey: "type")
        dictionary.setValue(self.visible, forKey: "visible")
        dictionary.setValue(self.in_visible, forKey: "in_visible")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.value, forKey: "value")
        dictionary.setValue(self.required, forKey: "required")

        return dictionary
    }

}
