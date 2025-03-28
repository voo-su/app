//
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use receiverDescriptor instead')
const Receiver$json = {
  '1': 'Receiver',
  '2': [
    {'1': 'chat_type', '3': 1, '4': 1, '5': 5, '10': 'chatType'},
    {'1': 'receiver_id', '3': 2, '4': 1, '5': 3, '10': 'receiverId'},
  ],
};

/// Descriptor for `Receiver`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receiverDescriptor = $convert.base64Decode(
    'CghSZWNlaXZlchIbCgljaGF0X3R5cGUYASABKAVSCGNoYXRUeXBlEh8KC3JlY2VpdmVyX2lkGA'
    'IgASgDUgpyZWNlaXZlcklk');

@$core.Deprecated('Use updatesRequestDescriptor instead')
const UpdatesRequest$json = {
  '1': 'UpdatesRequest',
};

/// Descriptor for `UpdatesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatesRequestDescriptor = $convert.base64Decode(
    'Cg5VcGRhdGVzUmVxdWVzdA==');

@$core.Deprecated('Use updateDescriptor instead')
const Update$json = {
  '1': 'Update',
  '2': [
    {'1': 'new_message', '3': 1, '4': 1, '5': 11, '6': '.chat.UpdateNewMessage', '9': 0, '10': 'newMessage'},
    {'1': 'chat_read_inbox', '3': 2, '4': 1, '5': 11, '6': '.chat.UpdateChatReadInbox', '9': 0, '10': 'chatReadInbox'},
    {'1': 'user_typing', '3': 3, '4': 1, '5': 11, '6': '.chat.UpdateUserTyping', '9': 0, '10': 'userTyping'},
    {'1': 'delete_messages', '3': 4, '4': 1, '5': 11, '6': '.chat.UpdateDeleteMessages', '9': 0, '10': 'deleteMessages'},
  ],
  '8': [
    {'1': 'update'},
  ],
};

/// Descriptor for `Update`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDescriptor = $convert.base64Decode(
    'CgZVcGRhdGUSOQoLbmV3X21lc3NhZ2UYASABKAsyFi5jaGF0LlVwZGF0ZU5ld01lc3NhZ2VIAF'
    'IKbmV3TWVzc2FnZRJDCg9jaGF0X3JlYWRfaW5ib3gYAiABKAsyGS5jaGF0LlVwZGF0ZUNoYXRS'
    'ZWFkSW5ib3hIAFINY2hhdFJlYWRJbmJveBI5Cgt1c2VyX3R5cGluZxgDIAEoCzIWLmNoYXQuVX'
    'BkYXRlVXNlclR5cGluZ0gAUgp1c2VyVHlwaW5nEkUKD2RlbGV0ZV9tZXNzYWdlcxgEIAEoCzIa'
    'LmNoYXQuVXBkYXRlRGVsZXRlTWVzc2FnZXNIAFIOZGVsZXRlTWVzc2FnZXNCCAoGdXBkYXRl');

@$core.Deprecated('Use updateNewMessageDescriptor instead')
const UpdateNewMessage$json = {
  '1': 'UpdateNewMessage',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 11, '6': '.chat.MessageItem', '10': 'message'},
  ],
};

/// Descriptor for `UpdateNewMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateNewMessageDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVOZXdNZXNzYWdlEisKB21lc3NhZ2UYASABKAsyES5jaGF0Lk1lc3NhZ2VJdGVtUg'
    'dtZXNzYWdl');

@$core.Deprecated('Use updateChatReadInboxDescriptor instead')
const UpdateChatReadInbox$json = {
  '1': 'UpdateChatReadInbox',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'last_read_inbox_message_id', '3': 2, '4': 1, '5': 9, '10': 'lastReadInboxMessageId'},
    {'1': 'unread_count', '3': 3, '4': 1, '5': 3, '10': 'unreadCount'},
  ],
};

/// Descriptor for `UpdateChatReadInbox`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatReadInboxDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVDaGF0UmVhZEluYm94EioKCHJlY2VpdmVyGAEgASgLMg4uY2hhdC5SZWNlaXZlcl'
    'IIcmVjZWl2ZXISOgoabGFzdF9yZWFkX2luYm94X21lc3NhZ2VfaWQYAiABKAlSFmxhc3RSZWFk'
    'SW5ib3hNZXNzYWdlSWQSIQoMdW5yZWFkX2NvdW50GAMgASgDUgt1bnJlYWRDb3VudA==');

@$core.Deprecated('Use updateUserTypingDescriptor instead')
const UpdateUserTyping$json = {
  '1': 'UpdateUserTyping',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'is_typing', '3': 3, '4': 1, '5': 8, '10': 'isTyping'},
  ],
};

/// Descriptor for `UpdateUserTyping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserTypingDescriptor = $convert.base64Decode(
    'ChBVcGRhdGVVc2VyVHlwaW5nEioKCHJlY2VpdmVyGAEgASgLMg4uY2hhdC5SZWNlaXZlclIIcm'
    'VjZWl2ZXISFwoHdXNlcl9pZBgCIAEoA1IGdXNlcklkEhsKCWlzX3R5cGluZxgDIAEoCFIIaXNU'
    'eXBpbmc=');

@$core.Deprecated('Use updateDeleteMessagesDescriptor instead')
const UpdateDeleteMessages$json = {
  '1': 'UpdateDeleteMessages',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'message_ids', '3': 2, '4': 3, '5': 9, '10': 'messageIds'},
  ],
};

/// Descriptor for `UpdateDeleteMessages`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateDeleteMessagesDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVEZWxldGVNZXNzYWdlcxIqCghyZWNlaXZlchgBIAEoCzIOLmNoYXQuUmVjZWl2ZX'
    'JSCHJlY2VpdmVyEh8KC21lc3NhZ2VfaWRzGAIgAygJUgptZXNzYWdlSWRz');

@$core.Deprecated('Use getChatsRequestDescriptor instead')
const GetChatsRequest$json = {
  '1': 'GetChatsRequest',
};

/// Descriptor for `GetChatsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatsRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRDaGF0c1JlcXVlc3Q=');

@$core.Deprecated('Use getChatsResponseDescriptor instead')
const GetChatsResponse$json = {
  '1': 'GetChatsResponse',
  '2': [
    {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.chat.ChatItem', '10': 'items'},
  ],
};

/// Descriptor for `GetChatsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatsResponseDescriptor = $convert.base64Decode(
    'ChBHZXRDaGF0c1Jlc3BvbnNlEiQKBWl0ZW1zGAEgAygLMg4uY2hhdC5DaGF0SXRlbVIFaXRlbX'
    'M=');

@$core.Deprecated('Use chatItemDescriptor instead')
const ChatItem$json = {
  '1': 'ChatItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'receiver', '3': 2, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'username', '3': 3, '4': 1, '5': 9, '10': 'username'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'name', '3': 5, '4': 1, '5': 9, '10': 'name'},
    {'1': 'surname', '3': 6, '4': 1, '5': 9, '10': 'surname'},
    {'1': 'msg_text', '3': 7, '4': 1, '5': 9, '10': 'msgText'},
    {'1': 'notify_settings', '3': 8, '4': 1, '5': 11, '6': '.common.EntityNotifySettings', '10': 'notifySettings'},
    {'1': 'unread_count', '3': 9, '4': 1, '5': 3, '10': 'unreadCount'},
    {'1': 'updated_at', '3': 10, '4': 1, '5': 9, '10': 'updatedAt'},
    {'1': 'is_online', '3': 11, '4': 1, '5': 8, '10': 'isOnline'},
    {'1': 'is_disturb', '3': 12, '4': 1, '5': 8, '10': 'isDisturb'},
    {'1': 'is_bot', '3': 13, '4': 1, '5': 8, '10': 'isBot'},
  ],
};

/// Descriptor for `ChatItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatItemDescriptor = $convert.base64Decode(
    'CghDaGF0SXRlbRIOCgJpZBgBIAEoA1ICaWQSKgoIcmVjZWl2ZXIYAiABKAsyDi5jaGF0LlJlY2'
    'VpdmVyUghyZWNlaXZlchIaCgh1c2VybmFtZRgDIAEoCVIIdXNlcm5hbWUSFgoGYXZhdGFyGAQg'
    'ASgJUgZhdmF0YXISEgoEbmFtZRgFIAEoCVIEbmFtZRIYCgdzdXJuYW1lGAYgASgJUgdzdXJuYW'
    '1lEhkKCG1zZ190ZXh0GAcgASgJUgdtc2dUZXh0EkUKD25vdGlmeV9zZXR0aW5ncxgIIAEoCzIc'
    'LmNvbW1vbi5FbnRpdHlOb3RpZnlTZXR0aW5nc1IObm90aWZ5U2V0dGluZ3MSIQoMdW5yZWFkX2'
    'NvdW50GAkgASgDUgt1bnJlYWRDb3VudBIdCgp1cGRhdGVkX2F0GAogASgJUgl1cGRhdGVkQXQS'
    'GwoJaXNfb25saW5lGAsgASgIUghpc09ubGluZRIdCgppc19kaXN0dXJiGAwgASgIUglpc0Rpc3'
    'R1cmISFQoGaXNfYm90GA0gASgIUgVpc0JvdA==');

@$core.Deprecated('Use getHistoryRequestDescriptor instead')
const GetHistoryRequest$json = {
  '1': 'GetHistoryRequest',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'message_id', '3': 2, '4': 1, '5': 3, '10': 'messageId'},
    {'1': 'limit', '3': 3, '4': 1, '5': 3, '10': 'limit'},
  ],
};

/// Descriptor for `GetHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHistoryRequestDescriptor = $convert.base64Decode(
    'ChFHZXRIaXN0b3J5UmVxdWVzdBIqCghyZWNlaXZlchgBIAEoCzIOLmNoYXQuUmVjZWl2ZXJSCH'
    'JlY2VpdmVyEh0KCm1lc3NhZ2VfaWQYAiABKANSCW1lc3NhZ2VJZBIUCgVsaW1pdBgDIAEoA1IF'
    'bGltaXQ=');

@$core.Deprecated('Use getHistoryResponseDescriptor instead')
const GetHistoryResponse$json = {
  '1': 'GetHistoryResponse',
  '2': [
    {'1': 'limit', '3': 1, '4': 1, '5': 3, '10': 'limit'},
    {'1': 'message_id', '3': 2, '4': 1, '5': 3, '10': 'messageId'},
    {'1': 'items', '3': 3, '4': 3, '5': 11, '6': '.chat.MessageItem', '10': 'items'},
  ],
};

/// Descriptor for `GetHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHistoryResponseDescriptor = $convert.base64Decode(
    'ChJHZXRIaXN0b3J5UmVzcG9uc2USFAoFbGltaXQYASABKANSBWxpbWl0Eh0KCm1lc3NhZ2VfaW'
    'QYAiABKANSCW1lc3NhZ2VJZBInCgVpdGVtcxgDIAMoCzIRLmNoYXQuTWVzc2FnZUl0ZW1SBWl0'
    'ZW1z');

@$core.Deprecated('Use messageItemDescriptor instead')
const MessageItem$json = {
  '1': 'MessageItem',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'receiver', '3': 2, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'msg_type', '3': 3, '4': 1, '5': 5, '10': 'msgType'},
    {'1': 'user_id', '3': 4, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
    {'1': 'media', '3': 6, '4': 1, '5': 11, '6': '.chat.MessageMedia', '10': 'media'},
    {'1': 'reply', '3': 7, '4': 1, '5': 11, '6': '.chat.MessageReply', '10': 'reply'},
    {'1': 'is_read', '3': 8, '4': 1, '5': 8, '10': 'isRead'},
    {'1': 'created_at', '3': 9, '4': 1, '5': 9, '10': 'createdAt'},
  ],
};

/// Descriptor for `MessageItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageItemDescriptor = $convert.base64Decode(
    'CgtNZXNzYWdlSXRlbRIOCgJpZBgBIAEoA1ICaWQSKgoIcmVjZWl2ZXIYAiABKAsyDi5jaGF0Ll'
    'JlY2VpdmVyUghyZWNlaXZlchIZCghtc2dfdHlwZRgDIAEoBVIHbXNnVHlwZRIXCgd1c2VyX2lk'
    'GAQgASgDUgZ1c2VySWQSGAoHY29udGVudBgFIAEoCVIHY29udGVudBIoCgVtZWRpYRgGIAEoCz'
    'ISLmNoYXQuTWVzc2FnZU1lZGlhUgVtZWRpYRIoCgVyZXBseRgHIAEoCzISLmNoYXQuTWVzc2Fn'
    'ZVJlcGx5UgVyZXBseRIXCgdpc19yZWFkGAggASgIUgZpc1JlYWQSHQoKY3JlYXRlZF9hdBgJIA'
    'EoCVIJY3JlYXRlZEF0');

@$core.Deprecated('Use messageMediaDescriptor instead')
const MessageMedia$json = {
  '1': 'MessageMedia',
  '2': [
    {'1': 'message_media_photo', '3': 1, '4': 1, '5': 11, '6': '.chat.MessageMediaPhoto', '9': 0, '10': 'messageMediaPhoto'},
    {'1': 'message_media_document', '3': 2, '4': 1, '5': 11, '6': '.chat.MessageMediaDocument', '9': 0, '10': 'messageMediaDocument'},
  ],
  '8': [
    {'1': 'media'},
  ],
};

/// Descriptor for `MessageMedia`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageMediaDescriptor = $convert.base64Decode(
    'CgxNZXNzYWdlTWVkaWESSQoTbWVzc2FnZV9tZWRpYV9waG90bxgBIAEoCzIXLmNoYXQuTWVzc2'
    'FnZU1lZGlhUGhvdG9IAFIRbWVzc2FnZU1lZGlhUGhvdG8SUgoWbWVzc2FnZV9tZWRpYV9kb2N1'
    'bWVudBgCIAEoCzIaLmNoYXQuTWVzc2FnZU1lZGlhRG9jdW1lbnRIAFIUbWVzc2FnZU1lZGlhRG'
    '9jdW1lbnRCBwoFbWVkaWE=');

@$core.Deprecated('Use messageMediaPhotoDescriptor instead')
const MessageMediaPhoto$json = {
  '1': 'MessageMediaPhoto',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'file', '3': 2, '4': 1, '5': 9, '10': 'file'},
  ],
};

/// Descriptor for `MessageMediaPhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageMediaPhotoDescriptor = $convert.base64Decode(
    'ChFNZXNzYWdlTWVkaWFQaG90bxIOCgJpZBgBIAEoCVICaWQSEgoEZmlsZRgCIAEoCVIEZmlsZQ'
    '==');

@$core.Deprecated('Use messageMediaDocumentDescriptor instead')
const MessageMediaDocument$json = {
  '1': 'MessageMediaDocument',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'mime_type', '3': 2, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'size', '3': 3, '4': 1, '5': 5, '10': 'size'},
    {'1': 'file', '3': 4, '4': 1, '5': 9, '10': 'file'},
  ],
};

/// Descriptor for `MessageMediaDocument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageMediaDocumentDescriptor = $convert.base64Decode(
    'ChRNZXNzYWdlTWVkaWFEb2N1bWVudBIOCgJpZBgBIAEoCVICaWQSGwoJbWltZV90eXBlGAIgAS'
    'gJUghtaW1lVHlwZRISCgRzaXplGAMgASgFUgRzaXplEhIKBGZpbGUYBCABKAlSBGZpbGU=');

@$core.Deprecated('Use messageReplyDescriptor instead')
const MessageReply$json = {
  '1': 'MessageReply',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'msg_type', '3': 2, '4': 1, '5': 5, '10': 'msgType'},
    {'1': 'user_id', '3': 3, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'username', '3': 4, '4': 1, '5': 9, '10': 'username'},
    {'1': 'content', '3': 5, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `MessageReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageReplyDescriptor = $convert.base64Decode(
    'CgxNZXNzYWdlUmVwbHkSDgoCaWQYASABKANSAmlkEhkKCG1zZ190eXBlGAIgASgFUgdtc2dUeX'
    'BlEhcKB3VzZXJfaWQYAyABKANSBnVzZXJJZBIaCgh1c2VybmFtZRgEIAEoCVIIdXNlcm5hbWUS'
    'GAoHY29udGVudBgFIAEoCVIHY29udGVudA==');

@$core.Deprecated('Use sendMessageRequestDescriptor instead')
const SendMessageRequest$json = {
  '1': 'SendMessageRequest',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    {'1': 'reply_to_msg_id', '3': 3, '4': 1, '5': 3, '10': 'replyToMsgId'},
  ],
};

/// Descriptor for `SendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageRequestDescriptor = $convert.base64Decode(
    'ChJTZW5kTWVzc2FnZVJlcXVlc3QSKgoIcmVjZWl2ZXIYASABKAsyDi5jaGF0LlJlY2VpdmVyUg'
    'hyZWNlaXZlchIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlEiUKD3JlcGx5X3RvX21zZ19pZBgD'
    'IAEoA1IMcmVwbHlUb01zZ0lk');

@$core.Deprecated('Use sendMessageResponseDescriptor instead')
const SendMessageResponse$json = {
  '1': 'SendMessageResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SendMessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMessageResponseDescriptor = $convert.base64Decode(
    'ChNTZW5kTWVzc2FnZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use inputMediaUploadedPhotoDescriptor instead')
const InputMediaUploadedPhoto$json = {
  '1': 'InputMediaUploadedPhoto',
  '2': [
    {'1': 'file', '3': 1, '4': 1, '5': 11, '6': '.common.InputFile', '10': 'file'},
  ],
};

/// Descriptor for `InputMediaUploadedPhoto`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputMediaUploadedPhotoDescriptor = $convert.base64Decode(
    'ChdJbnB1dE1lZGlhVXBsb2FkZWRQaG90bxIlCgRmaWxlGAEgASgLMhEuY29tbW9uLklucHV0Rm'
    'lsZVIEZmlsZQ==');

@$core.Deprecated('Use documentAttributeDescriptor instead')
const DocumentAttribute$json = {
  '1': 'DocumentAttribute',
  '2': [
    {'1': 'video', '3': 1, '4': 1, '5': 11, '6': '.common.DocumentAttributeVideo', '9': 0, '10': 'video'},
    {'1': 'audio', '3': 2, '4': 1, '5': 11, '6': '.common.DocumentAttributeAudio', '9': 0, '10': 'audio'},
    {'1': 'filename', '3': 3, '4': 1, '5': 11, '6': '.common.DocumentAttributeFilename', '9': 0, '10': 'filename'},
  ],
  '8': [
    {'1': 'attributes'},
  ],
};

/// Descriptor for `DocumentAttribute`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List documentAttributeDescriptor = $convert.base64Decode(
    'ChFEb2N1bWVudEF0dHJpYnV0ZRI2CgV2aWRlbxgBIAEoCzIeLmNvbW1vbi5Eb2N1bWVudEF0dH'
    'JpYnV0ZVZpZGVvSABSBXZpZGVvEjYKBWF1ZGlvGAIgASgLMh4uY29tbW9uLkRvY3VtZW50QXR0'
    'cmlidXRlQXVkaW9IAFIFYXVkaW8SPwoIZmlsZW5hbWUYAyABKAsyIS5jb21tb24uRG9jdW1lbn'
    'RBdHRyaWJ1dGVGaWxlbmFtZUgAUghmaWxlbmFtZUIMCgphdHRyaWJ1dGVz');

@$core.Deprecated('Use inputMediaUploadedDocumentDescriptor instead')
const InputMediaUploadedDocument$json = {
  '1': 'InputMediaUploadedDocument',
  '2': [
    {'1': 'file', '3': 1, '4': 1, '5': 11, '6': '.common.InputFile', '10': 'file'},
    {'1': 'mime_type', '3': 2, '4': 1, '5': 9, '10': 'mimeType'},
    {'1': 'attributes', '3': 3, '4': 1, '5': 11, '6': '.chat.DocumentAttribute', '10': 'attributes'},
  ],
};

/// Descriptor for `InputMediaUploadedDocument`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputMediaUploadedDocumentDescriptor = $convert.base64Decode(
    'ChpJbnB1dE1lZGlhVXBsb2FkZWREb2N1bWVudBIlCgRmaWxlGAEgASgLMhEuY29tbW9uLklucH'
    'V0RmlsZVIEZmlsZRIbCgltaW1lX3R5cGUYAiABKAlSCG1pbWVUeXBlEjcKCmF0dHJpYnV0ZXMY'
    'AyABKAsyFy5jaGF0LkRvY3VtZW50QXR0cmlidXRlUgphdHRyaWJ1dGVz');

@$core.Deprecated('Use inputMediaDescriptor instead')
const InputMedia$json = {
  '1': 'InputMedia',
  '2': [
    {'1': 'photo', '3': 1, '4': 1, '5': 11, '6': '.chat.InputMediaUploadedPhoto', '9': 0, '10': 'photo'},
    {'1': 'document', '3': 2, '4': 1, '5': 11, '6': '.chat.InputMediaUploadedDocument', '9': 0, '10': 'document'},
  ],
  '8': [
    {'1': 'media'},
  ],
};

/// Descriptor for `InputMedia`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputMediaDescriptor = $convert.base64Decode(
    'CgpJbnB1dE1lZGlhEjUKBXBob3RvGAEgASgLMh0uY2hhdC5JbnB1dE1lZGlhVXBsb2FkZWRQaG'
    '90b0gAUgVwaG90bxI+Cghkb2N1bWVudBgCIAEoCzIgLmNoYXQuSW5wdXRNZWRpYVVwbG9hZGVk'
    'RG9jdW1lbnRIAFIIZG9jdW1lbnRCBwoFbWVkaWE=');

@$core.Deprecated('Use sendMediaRequestDescriptor instead')
const SendMediaRequest$json = {
  '1': 'SendMediaRequest',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'media', '3': 2, '4': 1, '5': 11, '6': '.chat.InputMedia', '10': 'media'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'reply_to_msg_id', '3': 4, '4': 1, '5': 3, '10': 'replyToMsgId'},
  ],
};

/// Descriptor for `SendMediaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMediaRequestDescriptor = $convert.base64Decode(
    'ChBTZW5kTWVkaWFSZXF1ZXN0EioKCHJlY2VpdmVyGAEgASgLMg4uY2hhdC5SZWNlaXZlclIIcm'
    'VjZWl2ZXISJgoFbWVkaWEYAiABKAsyEC5jaGF0LklucHV0TWVkaWFSBW1lZGlhEhgKB21lc3Nh'
    'Z2UYAyABKAlSB21lc3NhZ2USJQoPcmVwbHlfdG9fbXNnX2lkGAQgASgDUgxyZXBseVRvTXNnSW'
    'Q=');

@$core.Deprecated('Use sendMediaResponseDescriptor instead')
const SendMediaResponse$json = {
  '1': 'SendMediaResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SendMediaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendMediaResponseDescriptor = $convert.base64Decode(
    'ChFTZW5kTWVkaWFSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use viewMessagesRequestDescriptor instead')
const ViewMessagesRequest$json = {
  '1': 'ViewMessagesRequest',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'message_ids', '3': 2, '4': 3, '5': 3, '10': 'messageIds'},
  ],
};

/// Descriptor for `ViewMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List viewMessagesRequestDescriptor = $convert.base64Decode(
    'ChNWaWV3TWVzc2FnZXNSZXF1ZXN0EioKCHJlY2VpdmVyGAEgASgLMg4uY2hhdC5SZWNlaXZlcl'
    'IIcmVjZWl2ZXISHwoLbWVzc2FnZV9pZHMYAiADKANSCm1lc3NhZ2VJZHM=');

@$core.Deprecated('Use viewMessagesResponseDescriptor instead')
const ViewMessagesResponse$json = {
  '1': 'ViewMessagesResponse',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'last_read_inbox_message_id', '3': 2, '4': 1, '5': 3, '10': 'lastReadInboxMessageId'},
    {'1': 'unread_count', '3': 3, '4': 1, '5': 3, '10': 'unreadCount'},
  ],
};

/// Descriptor for `ViewMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List viewMessagesResponseDescriptor = $convert.base64Decode(
    'ChRWaWV3TWVzc2FnZXNSZXNwb25zZRIqCghyZWNlaXZlchgBIAEoCzIOLmNoYXQuUmVjZWl2ZX'
    'JSCHJlY2VpdmVyEjoKGmxhc3RfcmVhZF9pbmJveF9tZXNzYWdlX2lkGAIgASgDUhZsYXN0UmVh'
    'ZEluYm94TWVzc2FnZUlkEiEKDHVucmVhZF9jb3VudBgDIAEoA1ILdW5yZWFkQ291bnQ=');

@$core.Deprecated('Use deleteMessagesRequestDescriptor instead')
const DeleteMessagesRequest$json = {
  '1': 'DeleteMessagesRequest',
  '2': [
    {'1': 'receiver', '3': 1, '4': 1, '5': 11, '6': '.chat.Receiver', '10': 'receiver'},
    {'1': 'message_ids', '3': 2, '4': 3, '5': 3, '10': 'messageIds'},
    {'1': 'revoke', '3': 3, '4': 1, '5': 8, '10': 'revoke'},
  ],
};

/// Descriptor for `DeleteMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessagesRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVNZXNzYWdlc1JlcXVlc3QSKgoIcmVjZWl2ZXIYASABKAsyDi5jaGF0LlJlY2Vpdm'
    'VyUghyZWNlaXZlchIfCgttZXNzYWdlX2lkcxgCIAMoA1IKbWVzc2FnZUlkcxIWCgZyZXZva2UY'
    'AyABKAhSBnJldm9rZQ==');

@$core.Deprecated('Use deleteMessagesResponseDescriptor instead')
const DeleteMessagesResponse$json = {
  '1': 'DeleteMessagesResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteMessagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteMessagesResponseDescriptor = $convert.base64Decode(
    'ChZEZWxldGVNZXNzYWdlc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

