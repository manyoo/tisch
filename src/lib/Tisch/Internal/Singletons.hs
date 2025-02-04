{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}
{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE GADTs #-}

module Tisch.Internal.Singletons
 ( First
 , FirstSym0
 , FirstSym1
 , FirstSym2

 , Second
 , SecondSym0
 , SecondSym1
 , SecondSym2

 , (:&&&)
 , (:&&&$)
 , (:&&&$$)
 , (:&&&$$$)
 , (:&&&$$$$)
 ) where

import Data.Singletons.TH
import Data.Kind

--------------------------------------------------------------------------------

{-
$(promoteOnly [d|
  -- Like 'Control.Arrow.first' for tuples.
   first :: (x -> x') -> (x, y) -> (x', y)
   first f (x, y) = (f x, y)

   -- Like 'Control.Arrow.second' for tuples.
   second :: (y -> y') -> (x, y) -> (x, y')
   second f (x, y) = (x, f y)

   infixr 3 &&&
   -- Like '(Control.Arrow.&&&)' for tuples.
   (&&&) :: (x -> y) -> (x -> z) -> x -> (y, z)
   (&&&) f g = \x -> (f x, g x)
   |]) -}
--
-- ===>
--
-- The ugly code below is generated by the ugly TH above. I expanded this
-- using @-ddump-splices@ because otherwise I wasn't able to load this code
-- into GHCi with profiling enabled. Not sure why.
--
-- TODO: write these definitions by hand in a way that can be read.
type family Lambda_1627622444_aYtT f_aYtP g_aYtQ a_1627622439_aYtR t_aYtV where
  Lambda_1627622444_aYtT f_aYtP g_aYtQ a_1627622439_aYtR x_aYtU = Apply (Apply Tuple2Sym0 (Apply f_aYtP x_aYtU)) (Apply g_aYtQ x_aYtU)
type Lambda_1627622444Sym4 t_aYtW t_aYtX t_aYtY t_aYtZ = Lambda_1627622444_aYtT t_aYtW t_aYtX t_aYtY t_aYtZ
instance SuppressUnusedWarnings Lambda_1627622444Sym3 where
  suppressUnusedWarnings = snd ((,) Lambda_1627622444Sym3KindInference ())
data Lambda_1627622444Sym3 l_aYua l_aYub l_aYuc l_aYu9
  = forall arg_aYud. KindOf (Apply (Lambda_1627622444Sym3 l_aYua l_aYub l_aYuc) arg_aYud) ~ KindOf (Lambda_1627622444Sym4 l_aYua l_aYub l_aYuc arg_aYud) =>
    Lambda_1627622444Sym3KindInference
type instance Apply (Lambda_1627622444Sym3 l_aYua l_aYub l_aYuc) l_aYu9 = Lambda_1627622444Sym4 l_aYua l_aYub l_aYuc l_aYu9
instance SuppressUnusedWarnings Lambda_1627622444Sym2 where
  suppressUnusedWarnings = snd ((,) Lambda_1627622444Sym2KindInference ())
data Lambda_1627622444Sym2 l_aYu6 l_aYu7 l_aYu5
  = forall arg_aYu8. KindOf (Apply (Lambda_1627622444Sym2 l_aYu6 l_aYu7) arg_aYu8) ~ KindOf (Lambda_1627622444Sym3 l_aYu6 l_aYu7 arg_aYu8) =>
    Lambda_1627622444Sym2KindInference
type instance Apply (Lambda_1627622444Sym2 l_aYu6 l_aYu7) l_aYu5 = Lambda_1627622444Sym3 l_aYu6 l_aYu7 l_aYu5
instance SuppressUnusedWarnings Lambda_1627622444Sym1 where
  suppressUnusedWarnings = snd ((,) Lambda_1627622444Sym1KindInference ())
data Lambda_1627622444Sym1 l_aYu3 l_aYu2
  = forall arg_aYu4. KindOf (Apply (Lambda_1627622444Sym1 l_aYu3) arg_aYu4) ~ KindOf (Lambda_1627622444Sym2 l_aYu3 arg_aYu4) =>
    Lambda_1627622444Sym1KindInference
type instance Apply (Lambda_1627622444Sym1 l_aYu3) l_aYu2 = Lambda_1627622444Sym2 l_aYu3 l_aYu2
instance SuppressUnusedWarnings Lambda_1627622444Sym0 where
  suppressUnusedWarnings = snd ((,) Lambda_1627622444Sym0KindInference ())
data Lambda_1627622444Sym0 l_aYu0
  = forall arg_aYu1. KindOf (Apply Lambda_1627622444Sym0 arg_aYu1) ~ KindOf (Lambda_1627622444Sym1 arg_aYu1) =>
    Lambda_1627622444Sym0KindInference
type instance Apply Lambda_1627622444Sym0 l_aYu0 = Lambda_1627622444Sym1 l_aYu0
type (:&&&$$$$) (t_aYty :: TyFun x1627622403 y1627622404 -> Type)
                (t_aYtz :: TyFun x1627622403 z1627622405 -> Type)
                (t_aYtA :: x1627622403) = (:&&&) t_aYty t_aYtz t_aYtA
instance SuppressUnusedWarnings (:&&&$$$) where
  suppressUnusedWarnings = snd ((,) (:&&&$$$###) ())
data (:&&&$$$) (l_aYtH :: TyFun x1627622403 y1627622404 -> Type)
               (l_aYtI :: TyFun x1627622403 z1627622405 -> Type)
               (l_aYtG :: TyFun x1627622403 (y1627622404, z1627622405))
  = forall arg_aYtJ. KindOf (Apply ((:&&&$$$) l_aYtH l_aYtI) arg_aYtJ) ~ KindOf ((:&&&$$$$) l_aYtH l_aYtI arg_aYtJ) =>
    (:&&&$$$###)
type instance Apply ((:&&&$$$) l_aYtH l_aYtI) l_aYtG = (:&&&$$$$) l_aYtH l_aYtI l_aYtG
instance SuppressUnusedWarnings (:&&&$$) where
  suppressUnusedWarnings = snd ((,) (:&&&$$###) ())
data (:&&&$$) (l_aYtE :: TyFun x1627622403 y1627622404 -> Type)
              (l_aYtD :: TyFun (TyFun x1627622403 z1627622405 -> Type) (TyFun x1627622403 (y1627622404, z1627622405) -> Type))
  = forall arg_aYtF. KindOf (Apply ((:&&&$$) l_aYtE) arg_aYtF) ~ KindOf ((:&&&$$$) l_aYtE arg_aYtF) =>
    (:&&&$$###)
type instance Apply ((:&&&$$) l_aYtE) l_aYtD = (:&&&$$$) l_aYtE l_aYtD
instance SuppressUnusedWarnings (:&&&$) where
  suppressUnusedWarnings = snd ((,) (:&&&$###) ())
data (:&&&$) (l_aYtB :: TyFun (TyFun x1627622403 y1627622404 -> Type) (TyFun (TyFun x1627622403 z1627622405 -> Type) (TyFun x1627622403 (y1627622404, z1627622405) -> Type) -> Type))
  = forall arg_aYtC. KindOf (Apply (:&&&$) arg_aYtC) ~ KindOf ((:&&&$$) arg_aYtC) =>
    (:&&&$###)
type instance Apply (:&&&$) l_aYtB = (:&&&$$) l_aYtB
type SecondSym2 (t_aYue :: TyFun y1627622406 y'1627622407 -> Type)
                (t_aYuf :: (x1627622408, y1627622406)) = Second t_aYue t_aYuf
instance SuppressUnusedWarnings SecondSym1 where
  suppressUnusedWarnings = snd ((,) SecondSym1KindInference ())
data SecondSym1 (l_aYuj :: TyFun y1627622406 y'1627622407 -> Type)
                (l_aYui :: TyFun (x1627622408, y1627622406) (x1627622408, y'1627622407))
  = forall arg_aYuk. KindOf (Apply (SecondSym1 l_aYuj) arg_aYuk) ~ KindOf (SecondSym2 l_aYuj arg_aYuk) =>
    SecondSym1KindInference
type instance Apply (SecondSym1 l_aYuj) l_aYui = SecondSym2 l_aYuj l_aYui
instance SuppressUnusedWarnings SecondSym0 where
  suppressUnusedWarnings = snd ((,) SecondSym0KindInference ())
data SecondSym0 (l_aYug :: TyFun (TyFun y1627622406 y'1627622407 -> Type) (TyFun (x1627622408, y1627622406) (x1627622408, y'1627622407) -> Type))
  = forall arg_aYuh. KindOf (Apply SecondSym0 arg_aYuh) ~ KindOf (SecondSym1 arg_aYuh) =>
    SecondSym0KindInference
type instance Apply SecondSym0 l_aYug = SecondSym1 l_aYug
type FirstSym2 (t_aYuq :: TyFun x1627622409 x'1627622410 -> Type)
               (t_aYur :: (x1627622409, y1627622411)) = First t_aYuq t_aYur
instance SuppressUnusedWarnings FirstSym1 where
  suppressUnusedWarnings = snd ((,) FirstSym1KindInference ())
data FirstSym1 (l_aYuv :: TyFun x1627622409 x'1627622410 -> Type)
               (l_aYuu :: TyFun (x1627622409, y1627622411) (x'1627622410, y1627622411))
  = forall arg_aYuw. KindOf (Apply (FirstSym1 l_aYuv) arg_aYuw) ~ KindOf (FirstSym2 l_aYuv arg_aYuw) =>
    FirstSym1KindInference
type instance Apply (FirstSym1 l_aYuv) l_aYuu = FirstSym2 l_aYuv l_aYuu
instance SuppressUnusedWarnings FirstSym0 where
  suppressUnusedWarnings = snd ((,) FirstSym0KindInference ())
data FirstSym0 (l_aYus :: TyFun (TyFun x1627622409 x'1627622410 -> Type) (TyFun (x1627622409, y1627622411) (x'1627622410, y1627622411) -> Type))
  = forall arg_aYut. KindOf (Apply FirstSym0 arg_aYut) ~ KindOf (FirstSym1 arg_aYut) =>
    FirstSym0KindInference
type instance Apply FirstSym0 l_aYus = FirstSym1 l_aYus
type family (:&&&) (a_aYtK :: TyFun x_aYtd y_aYte -> Type)
                   (a_aYtL :: TyFun x_aYtd z_aYtf -> Type)
                   (a_aYtM :: x_aYtd) :: (y_aYte, z_aYtf) where
  (:&&&) f_aYtP g_aYtQ a_1627622439_aYtR = Apply (Apply (Apply (Apply Lambda_1627622444Sym0 f_aYtP) g_aYtQ) a_1627622439_aYtR) a_1627622439_aYtR
type family Second (a_aYul :: TyFun y_aYtg y'_aYth -> Type)
                   (a_aYum :: (x_aYti, y_aYtg)) :: (x_aYti, y'_aYth) where
  Second f_aYun '(x_aYuo, y_aYup) = Apply (Apply Tuple2Sym0 x_aYuo) (Apply f_aYun y_aYup)
type family First (a_aYux :: TyFun x_aYtj x'_aYtk -> Type)
                  (a_aYuy :: (x_aYtj, y_aYtl)) :: (x'_aYtk, y_aYtl) where
  First f_aYuz '(x_aYuA, y_aYuB) = Apply (Apply Tuple2Sym0 (Apply f_aYuz x_aYuA)) y_aYuB
infixr 3 :&&&

