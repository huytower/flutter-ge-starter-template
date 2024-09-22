/// App runner Environment
/// - FREE_FAKE_API : when app using free fake api/mock api for testing, when server does not supply UAT env.
/// - UAT : Server already supplied for development
/// - PROD : MUST use this env. for release/submit app only
enum Environment {
  UAT,
  PROD,
  FREE_FAKE_API
}
