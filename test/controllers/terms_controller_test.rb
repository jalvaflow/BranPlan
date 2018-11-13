require "test_helper"

describe TermsController do
  let(:term) { terms :one }

  it "gets index" do
    get terms_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_term_url
    value(response).must_be :success?
  end

  it "creates term" do
    expect {
      post terms_url, params: { term: { comment: term.comment, end: term.end, name: term.name, start: term.start, term_id: term.term_id } }
    }.must_change "Term.count"

    must_redirect_to term_path(Term.last)
  end

  it "shows term" do
    get term_url(term)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_term_url(term)
    value(response).must_be :success?
  end

  it "updates term" do
    patch term_url(term), params: { term: { comment: term.comment, end: term.end, name: term.name, start: term.start, term_id: term.term_id } }
    must_redirect_to term_path(term)
  end

  it "destroys term" do
    expect {
      delete term_url(term)
    }.must_change "Term.count", -1

    must_redirect_to terms_path
  end
end
