defmodule Ffaker.En.YoutubeTest do
  use ExUnit.Case, async: true
  import Ffaker.En.Youtube
  import Ffaker.Matcher, only: [assert_match: 2, assert_in_file: 3]
  @path "en/youtube"

  test "url/0" do
    assert_match(~r/\Awww.youtube.com\/watch\?v=.+\z/, url)
  end

  test "share_url/0" do
    assert_match(~r/\Ayoutu.be\/.+\z/, share_url)
  end

  test "embed_url/0" do
    assert_match(~r/\Awww.youtube.com\/embed\/.+\z/, embed_url)
  end

  test "video_id/0" do
    assert_in_file(video_id, "video_ids", @path)
  end
end