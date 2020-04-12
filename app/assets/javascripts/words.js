$(document).on('turbolinks:load',function() {
  var i, len, ref, results, tag;
  $('#article-tags').tagit({
    fieldName: 'word[tag_list]',
    singleField: true,
    availableTags: gon.available_tags
  });
  if (gon.word_tags != null) {
    ref = gon._tags;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      tag = ref[i];
      results.push($('#article-tags').tagit('createTag', tag));
    }
    return results;
  }
});
