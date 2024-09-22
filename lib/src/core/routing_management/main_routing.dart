import 'enum/page_name_enum.dart';

String getPageName(PageNameEnum pageName) => '/${pageName.name.toLowerCase()}';

String getPageNameInternal(PageNameInternalEnum pageName) => '/${pageName.name.toLowerCase()}';
