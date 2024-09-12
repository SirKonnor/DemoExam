<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "request".
 *
 * @property int $id_request
 * @property string $StartDate
 * @property int $orgTechType_id
 * @property string $orgTechModel
 * @property string $ProblemDescryption
 * @property int $RequestStatus_id
 * @property string $CompletionDate
 * @property string $RepairParts
 * @property int $master_id
 * @property int $client_id
 */
class Request extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'request';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['StartDate', 'orgTechType_id', 'orgTechModel', 'ProblemDescryption', 'RequestStatus_id', 'CompletionDate', 'RepairParts', 'master_id', 'client_id'], 'required'],
            [['StartDate', 'CompletionDate'], 'safe'],
            [['orgTechType_id', 'RequestStatus_id', 'master_id', 'client_id'], 'integer'],
            [['orgTechModel', 'ProblemDescryption', 'RepairParts'], 'string', 'max' => 255],
            [['client_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_request' => 'Id Request',
            'StartDate' => 'Start Date',
            'orgTechType_id' => 'Org Tech Type ID',
            'orgTechModel' => 'Org Tech Model',
            'ProblemDescryption' => 'Problem Descryption',
            'RequestStatus_id' => 'Request Status ID',
            'CompletionDate' => 'Completion Date',
            'RepairParts' => 'Repair Parts',
            'master_id' => 'Master ID',
            'client_id' => 'Client ID',
        ];
    }
}
