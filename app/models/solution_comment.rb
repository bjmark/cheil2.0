class SolutionComment < Comment
  belongs_to :solution,:foreign_key => 'fk_id'
end
