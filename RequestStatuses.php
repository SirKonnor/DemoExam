<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "requestStatuses".
 *
 * @property int $id_requestStatuses
 * @property string $requestStatuses
 */
class RequestStatuses extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'requestStatuses';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['requestStatuses'], 'required'],
            [['requestStatuses'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_requestStatuses' => 'Id Request Statuses',
            'requestStatuses' => 'Request Statuses',
        ];
    }
}
