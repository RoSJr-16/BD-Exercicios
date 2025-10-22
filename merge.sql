use dbEtecMtec

MERGE tb3 dest
	USING tb2A ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED THEN
	INSERT values (ori.RM,
	ori.NomeAluno, ori.status)
	WHEN MATCHED THEN
	UPDATE SET dest.status += ori.status;

MERGE tb3 dest
	USING tb2A ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED THEN
	INSERT values (ori.RM,
	ori.nomeAluno, ori.status)
	WHEN MATCHED THEN
	UPDATE SET dest.status += ori.status;