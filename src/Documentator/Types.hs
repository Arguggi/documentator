{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Documentator.Types where

import Language.Haskell.Exts
import Language.Haskell.Exts.Syntax
import Language.Haskell.Exts.SrcLoc

type Extractor a = Module (SrcSpanInfo, [Comment]) -> a

type Located a = a (SrcSpanInfo, [Comment])
type Commented a = a [Comment]

forgetLocations :: Functor a => Located a -> Commented a
forgetLocations = fmap snd

clean :: Functor f => f a -> f ()
clean = fmap (const ())
