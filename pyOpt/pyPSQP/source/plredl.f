* SUBROUTINE PLREDL               ALL SYSTEMS                   98/12/01
C PORTABILITY : ALL SYSTEMS
C 98/12/01 LU : ORIGINAL VERSION
*
* PURPOSE :
* TRANSFORMATION OF THE INCOMPATIBLE QUADRATIC PROGRAMMING SUBPROBLEM.
*
* PARAMETERS :
*  II  NC  NUMBER OF CURRENT LINEAR CONSTRAINTS.
*  RI  CF(NF)  VECTOR CONTAINING VALUES OF THE CONSTRAINT FUNCTIONS.
*  II  IC(NC)  VECTOR CONTAINING TYPES OF CONSTRAINTS.
*  RI  CL(NC)  VECTOR CONTAINING LOWER BOUNDS FOR CONSTRAINT FUNCTIONS.
*  RI  CU(NC)  VECTOR CONTAINING UPPER BOUNDS FOR CONSTRAINT FUNCTIONS.
*  II  KBC  SPECIFICATION OF LINEAR CONSTRAINTS. KBC=0-NO LINEAR
*         CONSTRAINTS. KBC=1-ONE SIDED LINEAR CONSTRAINTS. KBC=2=TWO
*         SIDED LINEAR CONSTRAINTS.
*
      SUBROUTINE PLREDL(NC,CF,IC,CL,CU,KBC)
      INTEGER NC,IC(NC),KBC,K
      DOUBLE PRECISION CF(*),CL(*),CU(*)
      DOUBLE PRECISION TEMP
      INTEGER KC
      IF (KBC.GT.0) THEN
      DO 1 KC=1,NC
      K=IC(KC)
      IF (ABS(K).EQ.1.OR.ABS(K).EQ.3.OR.ABS(K).EQ.4) THEN
      TEMP=(CF(KC)-CL(KC))
      IF (TEMP.LT.0) CF(KC)=CL(KC)+0.1D 0*TEMP
      ENDIF
      IF (ABS(K).EQ.2.OR.ABS(K).EQ.3.OR.ABS(K).EQ.4) THEN
      TEMP=(CF(KC)-CU(KC))
      IF (TEMP.GT.0) CF(KC)=CU(KC)+0.1D 0*TEMP
      ENDIF
      IF (ABS(K).EQ.5.OR.ABS(K).EQ.6) THEN
      TEMP=(CF(KC)-CL(KC))
      CF(KC)=CL(KC)+0.1D 0*TEMP
      ENDIF
    1 CONTINUE
      ENDIF
      RETURN
      END
