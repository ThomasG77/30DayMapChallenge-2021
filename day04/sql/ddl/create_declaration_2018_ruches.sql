CREATE TABLE declaration_2018_ruches
(
  region character varying,
  departement character varying,
  tranche character varying,
  nb_decl_w_siret integer,
  nb_decl_wo_siret integer,
  nb_colonies integer
)
WITH (
  OIDS=FALSE
);

COPY declaration_2018_ruches FROM '/tmp/statistiques_declaration_ruches_2018_depts_cleaned.csv' DELIMITER ';' CSV HEADER;

WITH pivot AS (
  SELECT departement, tranche,
  CASE
    WHEN tranche = '0 à 9' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_0_9,
  CASE
    WHEN tranche = '10 à 49' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_10_49,
  CASE
    WHEN tranche = '50 à 99' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_50_99,
  CASE
    WHEN tranche = '100 à 149' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_100_149,
  CASE
    WHEN tranche = '150 à 199' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_150_199,
  CASE
    WHEN tranche = '200 à 399' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_200_399,
  CASE
    WHEN tranche = '400 à 699' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_400_699,
  CASE
    WHEN tranche = '700 à 999' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_700_999,
  CASE
    WHEN tranche = '⩾ 1000' THEN nb_decl_w_siret
    ELSE 0
  END AS nb_decl_w_siret_sup_1000,
  CASE
    WHEN tranche = '0 à 9' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_0_9,
  CASE
    WHEN tranche = '10 à 49' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_10_49,
  CASE
    WHEN tranche = '50 à 99' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_50_99,
  CASE
    WHEN tranche = '100 à 149' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_100_149,
  CASE
    WHEN tranche = '150 à 199' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_150_199,
  CASE
    WHEN tranche = '200 à 399' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_200_399,
  CASE
    WHEN tranche = '400 à 699' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_400_699,
  CASE
    WHEN tranche = '700 à 999' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_700_999,
  CASE
    WHEN tranche = '⩾ 1000' THEN nb_decl_wo_siret
    ELSE 0
  END AS nb_decl_wo_siret_sup_1000,
  CASE
    WHEN tranche = '0 à 9' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_0_9,
  CASE
    WHEN tranche = '10 à 49' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_10_49,
  CASE
    WHEN tranche = '50 à 99' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_50_99,
  CASE
    WHEN tranche = '100 à 149' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_100_149,
  CASE
    WHEN tranche = '150 à 199' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_150_199,
  CASE
    WHEN tranche = '200 à 399' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_200_399,
  CASE
    WHEN tranche = '400 à 699' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_400_699,
  CASE
    WHEN tranche = '700 à 999' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_700_999,
  CASE
    WHEN tranche = '⩾ 1000' THEN nb_colonies
    ELSE 0
  END AS nb_colonies_sup_1000
  FROM declaration_2018_ruches
), agg AS (
SELECT departement,
SUM(nb_decl_w_siret_0_9) AS nb_decl_w_siret_0_9,
SUM(nb_decl_w_siret_10_49) AS nb_decl_w_siret_10_49,
SUM(nb_decl_w_siret_50_99) AS nb_decl_w_siret_50_99,
SUM(nb_decl_w_siret_100_149) AS nb_decl_w_siret_100_149,
SUM(nb_decl_w_siret_150_199) AS nb_decl_w_siret_150_199,
SUM(nb_decl_w_siret_200_399) AS nb_decl_w_siret_200_399,
SUM(nb_decl_w_siret_400_699) AS nb_decl_w_siret_400_699,
SUM(nb_decl_w_siret_700_999) AS nb_decl_w_siret_700_999,
SUM(nb_decl_w_siret_sup_1000) AS nb_decl_w_siret_sup_1000,
SUM(nb_decl_wo_siret_0_9) AS nb_decl_wo_siret_0_9,
SUM(nb_decl_wo_siret_10_49) AS nb_decl_wo_siret_10_49,
SUM(nb_decl_wo_siret_50_99) AS nb_decl_wo_siret_50_99,
SUM(nb_decl_wo_siret_100_149) AS nb_decl_wo_siret_100_149,
SUM(nb_decl_wo_siret_150_199) AS nb_decl_wo_siret_150_199,
SUM(nb_decl_wo_siret_200_399) AS nb_decl_wo_siret_200_399,
SUM(nb_decl_wo_siret_400_699) AS nb_decl_wo_siret_400_699,
SUM(nb_decl_wo_siret_700_999) AS nb_decl_wo_siret_700_999,
SUM(nb_decl_wo_siret_sup_1000) AS nb_decl_wo_siret_sup_1000,
SUM(nb_colonies_0_9) AS nb_colonies_0_9,
SUM(nb_colonies_10_49) AS nb_colonies_10_49,
SUM(nb_colonies_50_99) AS nb_colonies_50_99,
SUM(nb_colonies_100_149) AS nb_colonies_100_149,
SUM(nb_colonies_150_199) AS nb_colonies_150_199,
SUM(nb_colonies_200_399) AS nb_colonies_200_399,
SUM(nb_colonies_400_699) AS nb_colonies_400_699,
SUM(nb_colonies_700_999) AS nb_colonies_700_999,
SUM(nb_colonies_sup_1000) AS nb_colonies_sup_1000
FROM pivot GROUP BY departement
ORDER BY departement ASC
)
SELECT
departement,
nom_dep,
nb_decl_w_siret_0_9,
nb_decl_w_siret_10_49,
nb_decl_w_siret_50_99,
nb_decl_w_siret_100_149,
nb_decl_w_siret_150_199,
nb_decl_w_siret_200_399,
nb_decl_w_siret_400_699,
nb_decl_w_siret_700_999,
nb_decl_w_siret_sup_1000,
nb_decl_wo_siret_0_9,
nb_decl_wo_siret_10_49,
nb_decl_wo_siret_50_99,
nb_decl_wo_siret_100_149,
nb_decl_wo_siret_150_199,
nb_decl_wo_siret_200_399,
nb_decl_wo_siret_400_699,
nb_decl_wo_siret_700_999,
nb_decl_wo_siret_sup_1000,
nb_decl_w_siret_0_9 + nb_decl_wo_siret_0_9 AS nb_decl_0_9,
nb_decl_w_siret_10_49 + nb_decl_wo_siret_10_49 AS nb_decl_10_49,
nb_decl_w_siret_50_99 + nb_decl_wo_siret_50_99 AS nb_decl_50_99,
nb_decl_w_siret_100_149 + nb_decl_wo_siret_100_149 AS nb_decl_100_149,
nb_decl_w_siret_150_199 + nb_decl_wo_siret_150_199 AS nb_decl_150_199,
nb_decl_w_siret_200_399 + nb_decl_wo_siret_200_399 AS nb_decl_200_399,
nb_decl_w_siret_400_699 + nb_decl_wo_siret_400_699 AS nb_decl_400_699,
nb_decl_w_siret_700_999 + nb_decl_wo_siret_700_999 AS nb_decl_700_999,
nb_decl_w_siret_sup_1000 + nb_decl_wo_siret_sup_1000 AS nb_decl_sup_1000,
nb_colonies_0_9,
nb_colonies_10_49,
nb_colonies_50_99,
nb_colonies_100_149,
nb_colonies_150_199,
nb_colonies_200_399,
nb_colonies_400_699,
nb_colonies_700_999,
nb_colonies_sup_1000,
nb_decl_w_siret_0_9 + nb_decl_w_siret_10_49 + nb_decl_w_siret_50_99 + nb_decl_w_siret_100_149 + nb_decl_w_siret_150_199 + nb_decl_w_siret_200_399 + nb_decl_w_siret_400_699 + nb_decl_w_siret_700_999 + nb_decl_w_siret_sup_1000 AS tot_nb_decl_w_siret,
nb_decl_wo_siret_0_9 + nb_decl_wo_siret_10_49 + nb_decl_wo_siret_50_99 + nb_decl_wo_siret_100_149 + nb_decl_wo_siret_150_199 + nb_decl_wo_siret_200_399 + nb_decl_wo_siret_400_699 + nb_decl_wo_siret_700_999 + nb_decl_wo_siret_sup_1000 AS tot_nb_decl_wo_siret,
nb_decl_w_siret_0_9 + nb_decl_w_siret_10_49 + nb_decl_w_siret_50_99 + nb_decl_w_siret_100_149 + nb_decl_w_siret_150_199 + nb_decl_w_siret_200_399 + nb_decl_w_siret_400_699 + nb_decl_w_siret_700_999 + nb_decl_w_siret_sup_1000 + nb_decl_wo_siret_0_9 + nb_decl_wo_siret_10_49 + nb_decl_wo_siret_50_99 + nb_decl_wo_siret_100_149 + nb_decl_wo_siret_150_199 + nb_decl_wo_siret_200_399 + nb_decl_wo_siret_400_699 + nb_decl_wo_siret_700_999 + nb_decl_wo_siret_sup_1000 AS tot_nb_decl,
nb_colonies_0_9 + nb_colonies_10_49 + nb_colonies_50_99 + nb_colonies_100_149 + nb_colonies_150_199 + nb_colonies_200_399 + nb_colonies_400_699 + nb_colonies_700_999 + nb_colonies_sup_1000  AS tot_nb_colonies,
geom
FROM departements
LEFT JOIN agg
ON departement = insee_dep;
