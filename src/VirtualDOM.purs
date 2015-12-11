module VirtualDOM
  ( PatchObject()
  , createElement
  , diff
  , patch
  ) where

import Prelude
import Control.Monad.Eff
import Data.Function
import DOM
import DOM.Node.Types (Node())
import VirtualDOM.VTree

-- PatchObject represents an Array<VPatch>, where each VPatch is a patch
-- operation.  See virtual-dom/docs.jsig for details.
foreign import data PatchObject :: *

foreign import showPatchObjectImpl :: PatchObject -> String

instance showPatchObject :: Show PatchObject where
  show = showPatchObjectImpl

foreign import createElement :: VTree -> Node

-- foreign import diff' :: Fn2 VTree VTree PatchObject

-- diff :: VTree -> VTree -> PatchObject
-- diff = runFn2 diff'

foreign import diff :: VTree -> VTree -> PatchObject
foreign import patch :: forall e. Node -> PatchObject -> Eff (dom :: DOM | e) Node

-- foreign import patch' :: Fn2 Node PatchObject Node

-- patch :: forall e. PatchObject -> Node -> Eff (dom :: DOM | e) Node
-- patch p n = mkEff \_ -> runFn2 patch' n p

-- foreign import mkEff :: forall eff a. (Unit -> a) -> Eff eff a
