module Tests exposing (..)

import Test exposing (..)
import Expect
import PhoneNumber exposing (getNumber, prettyPrint)


tests : Test
tests =
    describe "PhoneNumber"
        [ test "cleans number" <|
            \() -> Expect.equal (Just "2234567890") (getNumber "(223) 456-7890")
        , skip <|
            test "cleans number with dots" <|
                \() -> Expect.equal (Just "2234567890") (getNumber "223.456.7890")
        , skip <|
            test "valid when 11 digits and first is 1" <|
                \() -> Expect.equal (Just "2234567890") (getNumber "12234567890")
        , skip <|
            test "invalid when 11 digits" <|
                \() -> Expect.equal Nothing (getNumber "21234567890")
        , skip <|
            test "invalid when 9 digits" <|
                \() -> Expect.equal Nothing (getNumber "123456789")
        , skip <|
            test "invalid when 12 digits" <|
                \() -> Expect.equal Nothing (getNumber "123456789012")
        , skip <|
            test "invalid when N in area code is 1" <|
                \() -> Expect.equal Nothing (getNumber "1234567890")
        , skip <|
            test "invalid when N in exchange code is 1" <|
                \() -> Expect.equal Nothing (getNumber "2341567890")
        , skip <|
            test "invalid when empty" <|
                \() -> Expect.equal Nothing (getNumber "")
        , skip <|
            test "invalid when no digits present" <|
                \() -> Expect.equal Nothing (getNumber " (-) ")
        , skip <|
            test "valid with leading characters" <|
                \() -> Expect.equal (Just "2234567890") (getNumber "my number is 223 456 7890")
        , skip <|
            test "valid with trailing characters" <|
                \() -> Expect.equal (Just "2234567890") (getNumber "223 456 7890 - bob")
        , skip <|
            test "pretty print" <|
                \() -> Expect.equal (Just "(223) 456-7890") (prettyPrint "2234567890")
        , skip <|
            test "pretty print with full us phone number" <|
                \() -> Expect.equal (Just "(223) 456-7890") (prettyPrint "12234567890")
        ]
