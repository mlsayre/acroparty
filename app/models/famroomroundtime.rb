class Famroomroundtime < ActiveRecord::Base
  attr_accessible :r1prep, :r1res, :r1vote, :r1write, :r2prep, :r2write,
  :r2vote, :r2res, :r3prep, :r3write, :r3vote, :r3res, :r4prep, :r4write,
  :r4vote, :r4res, :r5prep, :r5write, :r5vote, :r5res, :r6prep, :r6write,
  :r6vote, :r6res, :r7prep, :r7write, :r7vote, :r7res, :r8prep, :r8write,
  :r8vote, :r8res, :r9prep, :r9write, :r9vote, :r9res, :r10prep, :r10write,
  :r10vote, :r10res, :finalresults, :newgamestarts
end
