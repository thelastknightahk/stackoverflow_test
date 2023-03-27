enum ReputationChangeType {
  postUpvote,
  postDownvote,
  acceptedAnswer,
  bountyEarned,
  bountyLost,
  suggestedEditApproved,
  suggestedEditRejected,
}

class ReputationChange {
  ReputationChange({
    required this.type,
    
  });

  final ReputationChangeType type;
   
}
