let mandog = words "I am a man and my dog is a good dog and a good dog makes a good man";;

let print_table table = Hashtbl.fold (fun k v acc -> (k, v) :: acc) table [];;
(fun h -> Hashtbl.fold (fun k v acc -> (k, v) :: acc) h []) dogtbl;;

(let table = Hashtbl.create 16 in
 Hashtbl.add table "a"
   {total = 7;
    amounts =
      [("man", 1); ("land", 1); ("kitchen", 1); ("house", 2); ("fridge", 1);
       ("beer", 1)]} ;
 Hashtbl.add table "has" {total = 1; amounts = [("a", 1)]} ;
 Hashtbl.add table "is" {total = 3; amounts = [("no", 1); ("a", 2)]} ;
 Hashtbl.add table "there" {total = 3; amounts = [("is", 3)]} ;
 Hashtbl.add table "man" {total = 1; amounts = [("who", 1)]} ;
 Hashtbl.add table "where" {total = 2; amounts = [("there", 2)]} ;
 Hashtbl.add table "beer" {total = 2; amounts = [("in", 2)]} ;
 Hashtbl.add table "kitchen"
   {total = 2; amounts = [("in", 1); ("STOP", 1)]} ;
 Hashtbl.add table "no" {total = 1; amounts = [("beer", 1)]} ;
 Hashtbl.add table "land" {total = 1; amounts = [("where", 1)]} ;
 Hashtbl.add table "who" {total = 1; amounts = [("has", 1)]} ;
 Hashtbl.add table "fridge" {total = 1; amounts = [("in", 1)]} ;
 Hashtbl.add table "the" {total = 1; amounts = [("kitchen", 1)]} ;
 Hashtbl.add table "in" {total = 5; amounts = [("the", 1); ("a", 4)]} ;
 Hashtbl.add table "START" {total = 1; amounts = [("there", 1)]} ;
 Hashtbl.add table "house"
   {total = 2; amounts = [("where", 1); ("in", 1)]} ;
 table)

(* Char values - \32 -> \255 *)

let testthing = "The Christmas Cottage, a biopic about the artist Thomas Kinkade, famous for the quaint-scary-ugly paintings he sells in shopping malls, is a cinematic portrait of the multimillionaire artist as a young man. Kinkade co-produced the movie, which went straight to DVD when it came out in 2008. In a pivotal scene, the budding “Painter of Light,” home from college, gathers with his mother and younger brother on Christmas morning.";;

List.
let stru = Str.full_split (Str.regexp "[\\.\\?\\!]+") testthing;;

  let corpus_splitter : string list =
    let tagged_split = Str.full_split (Str.regexp "[\\.\\?\\!]+") str in
    let rec list_builder (sentence_list : string list) (to_consume : Str.split_result list) =
      match to_consume with
      | [] -> sentence_list
      | Text (s) :: Delim (d) :: tl -> list_builder ((s ^ d) :: sentence_list) tl
    in
    list_builder [] tagged_split
  in
  List.map words corpus_splitter;;


  let rec sentence_builder
      (sentences : string list)
      (offset : int)
      (length : int) : string list =
    try
      let char_at = str.[length + offset] in
      match char_at with
      | c when is_terminator char_at ->
        (print_string "Found a terminator!";
          sentence_builder ((String.sub str offset length) :: sentences) (length + 1) 0)
      | c -> sentence_builder sentences offset (length + 1)
    with
    | _ -> sentences
  in
  (sentence_builder sentence_list 0 0);;

words "a good woman is proud of her daughter and a good daughter is proud of her mom";;

String.make 1 '\'';;

let s1 = "The Christmas Cottage, a biopic about the artist Thomas Kinkade, famous for the quaint-scary-ugly paintings he sells in shopping malls, is a cinematic portrait of the multimillionaire artist as a young man. Kinkade co-produced the movie, which went straight to DVD when it came out in 2008. In a pivotal scene, the budding “Painter of Light,” home from college, gathers with his mother and younger brother on Christmas morning.";;

let s2 = "It’s the mid-Seventies in Placerville, California, a small town in the foothills of the Sierra Nevada. The Kinkades are a poor family living in a rundown house. Kinkade’s mother, divorced from his father, has lost her job, and because she is generous to other people in the town—“she loaned people money, she gave people things”—and because she refuses assistance from anyone else, the Kinkades are about to lose what they call “the cottage.” The bank is foreclosing; they’ve only got a few days left to pay";;

let s3 = "Young Thom—the grown-up artist spells the short version of his name that way—and his brother have been working hard to raise money for their mother’s overdue mortgage payment, but they haven’t put together enough cash. They can’t save the house, so understandably they don’t have store-bought Christmas gifts to exchange. Instead, Thom (Jared Padalecki, from Gilmore Girls) presents his mother (Marcia Gay Harden) with a picture of their house he’s drawn himself, so she’ll always have something by which to remember what they’re about to lose.";;

let testmerge =
  let table1 = build_ptable (words s1) 2 in
  let table2 = build_ptable (words s2) 2 in
  let table3 = build_ptable (words s3) 2 in

  merge_ptables [table1; table2; table3];;


merge_distributions {total = 3; amounts = [("no", 1); ("a", 2)]} {total = 5; amounts = [("the", 1); ("a", 4)]};;


  let d1freqs = distribution1.amounts in
  let d2freqs = distribution2.amounts in

  let rec frequency_merger shorter longer =
    match shorter with
    | [] -> longer
    | hd :: tl ->
      match hd with
      | (name, freq) ->
        if List.exists (fun x -> x = name) longer then
          let longer_entry = List.assoc name longer in


  {total = distribution1.total + distribution2.total;
   amounts = };;
