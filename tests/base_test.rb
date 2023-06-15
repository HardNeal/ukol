require "test/unit"
require "base"

class BaseTest < Test::Unit::TestCase

  def test_request
    assert_equal :"GET_/", Base.request(:get, "/"){}
  end

  def test_get
    assert_equal :"GET_/", Base.get("/"){}
  end

  def test_post
    assert_equal :"POST_/", Base.post("/"){}
  end

  def test_call
    Base.request(:get, "/"){ "Hello Word" }

    assert_equal [200, {"Content-type"=>"text/html"}, ["Hello Word"]],
                 Base.call({"PATH_INFO"=>"/", "REQUEST_METHOD"=>"GET"})
  end

  def test_env_render
    Base.request(:get, "/view"){ @var = "test muni" }
    env = Base::Env.new
    env.call({"PATH_INFO"=>"/view", "REQUEST_METHOD"=>"GET"})

    assert_equal "Hello test muni", env.render
  end
end
