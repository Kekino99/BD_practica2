CREATE FUNCTION PilotLider(integer) RETURNS boolean AS '
DECLARE
	dorsal ALIAS FOR $1;
	equip pilot%nom_eq;
	max_dorsal pilot%dorsal;
BEGIN
	SELECT INTO equip p.nom_eq FROM pilot p WHERE p.dorsal = dorsal;
	SELECT INTO max_dorsal p.dorsal
	FROM pilot p
	WHERE p.punts_campionat=(SELECT MAX(punts_campionat)
		FROM pilot p WHERE p.nom_equip=equip;
	
	IF max_dorsal=dorsal THEN
		RETURN TRUE;
	ELSE
		RETURN FALSE;
	END IF;
END;
' LANGUAGE 'plpgsql'


