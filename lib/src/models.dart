class GhostscriptRevision {
  final String product;
  final String copyright;
  final int revision;
  final int revisionDate;

  const GhostscriptRevision({
    required this.product,
    required this.copyright,
    required this.revision,
    required this.revisionDate,
  });
  @override
  String toString() =>
      "GhostscriptRevision<$product, $copyright, Revision=$revision, RevisionDate=$revisionDate>";
}
