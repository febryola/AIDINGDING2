;Survey ini dilakukan untuk memprediksi penyakit hepatitis seseorang

(defrule system-banner ""
  (declare (salience 10))
  =>
  (printout t crlf crlf)
  (printout t "Survey Prediksi Penyakit Hepatitis B")
  (printout t crlf crlf))
;--------------------------
(defrule cekHBsAg
=>
(printout t "Apakah anda menderita HBsAg [positive/negative]? ")
(assert (HBsAg (read))))

(defrule cekAntiHDV
(HBsAg positive)
=>
(printout t "Apakah anda anti-HDV [positive/negative]? ")
(assert (anti-HDV (read))))

(defrule cekAnti-HBc
(and (HBsAg positive)
(anti-HDV negative))
=>
(printout t "Apakah anda anti-HBc [positive/negative]? ")
(assert (anti-HBc (read))))

(defrule hepatitisB+D
(and (HBsAg positive)
(anti-HDV positive))
=>
(printout t "Anda menderita Hepatitis B+D" crlf)
(assert (Hepatitis B+D positive)))

(defrule cekAnti-HBs
(and (HBsAg positive)
(anti-HDV negative)(anti-HBc positive))
=>
(printout t "Apakah anda anti-HBs [positive/negative]? ")
(assert (anti-HBs (read))))


(defrule noAnti-HBc
(and (HBsAg positive)
(anti-HDV negative)(anti-HBc negative))
=>
(printout t "Uncertain Configuration" crlf)
(assert (Uncertain Configuration)))

(defrule IgMAnti-HBc
(and (HBsAg positive)
(anti-HDV negative)(anti-HBc positive)(anti-HBs negative))
=>
(printout t "Apakah anda IgM anti-HBc [positive/negative]? ")
(assert (igmanti-HBc (read))))

(defrule noIgMAnti-HBc
(and (HBsAg positive)
(anti-HDV negative)(anti-HBc positive)(anti-HBs positive))
=>
(printout t "Uncertain Configuration" crlf)
(assert (Uncertain Configuration positive)))

(defrule posIgMAnti-HBc
(and (HBsAg positive)
(anti-HDV negative)(anti-HBc positive)(anti-HBs negative)(igmanti-HBc positive))
=>
(printout t "Acure Infection" crlf)
(assert (Acure Infection positive)))

(defrule noposIgMAnti-HBc
(and (HBsAg positive)
(anti-HDV negative)(anti-HBc positive)(anti-HBs negative)(igmanti-HBc negative))
=>
(printout t "Chronic Infection" crlf)
(assert (Chronic Infection positive)))

(defrule cekAnti-HBs2
(and (HBsAg negative))
=>
(printout t "Apakah anda anti-HBs [positive/negative]? ")
(assert (anti-HBs-2 (read))))

(defrule cekAnti-HBc2
(and (HBsAg negative)(anti-HBs-2 positive))
=>
(printout t "Apakah anda anti-HBc [positive/negative]? ")
(assert (anti-HBc-2 (read))))

(defrule cekAnti-HBc3
(and (HBsAg negative)(anti-HBs-2 negative))
=>
(printout t "Apakah anda anti-HBc [positive/negative]? ")
(assert (anti-HBc-3 (read))))

(defrule cekAnti-HBc2-lanj
(and (HBsAg negative)(anti-HBs-2 positive)(anti-HBc-2 positive))
=>
(printout t "Cured" crlf)
(assert (Cured positive)))

(defrule cekNoAnti-HBc2-lanj
(and (HBsAg negative)(anti-HBs-2 positive)(anti-HBc-2 negative))
=>
(printout t "Vaccinated" crlf)
(assert (Vaccinated positive)))

(defrule cekAnti-HBc3-lanj
(and (HBsAg negative)(anti-HBs-2 negative)(anti-HBc-3 positive))
=>
(printout t "Unclear (Possible resolved)" crlf)
(assert (Unclear positive)))

(defrule cekNoAnti-HBc3-lanj
(and (HBsAg negative)(anti-HBs-2 negative)(anti-HBc-3 negative))
=>
(printout t "Healthy not vaccinated or suspicious" crlf)
(assert (Healthy-not-vaccinated positive)))
