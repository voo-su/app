class CreateGroupChatParams {
  final String name;

  const CreateGroupChatParams({required this.name});
}

class AddUserParams {
  final int id;
  final List<int> userIds;

  const AddUserParams({required this.id, required this.userIds});
}

class RemoveUserParams {
  final int id;
  final int userId;

  const RemoveUserParams({required this.id, required this.userId});
}

class EditGroupNameParams {
  final int groupId;
  final String newName;

  EditGroupNameParams({required this.groupId, required this.newName});
}

class EditGroupDescriptionParams {
  final int groupId;
  final String newDescription;

  EditGroupDescriptionParams({
    required this.groupId,
    required this.newDescription,
  });
}
