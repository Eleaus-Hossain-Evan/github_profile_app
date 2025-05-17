part of 'extensions.dart';

extension AsyncValueListener on WidgetRef {
  void handleAsyncValue<T>(
    BuildContext context,
    AsyncValue<T>? previous,
    AsyncValue<T> next,
  ) {
    if (next is AsyncLoading) {
      BotToast.showLoading();
    }
    if (next is AsyncData) {
      BotToast.closeAllLoading();
    }
    if (next is AsyncError) {
      BotToast.closeAllLoading();
      String errText = '';
      if (next.error is AppException) {
        errText = (next.error as AppException).message;
      } else {
        errText = next.error.toString();
      }
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: AppText(
              errText,
              color: context.color.error,
            ),
            backgroundColor: context.color.errorContainer,
          ),
        );
    }
  }
}
